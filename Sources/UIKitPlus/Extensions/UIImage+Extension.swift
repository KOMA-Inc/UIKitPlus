import UIKit

public extension UIImage {
    var megabytesSize: Double {
        guard let imageData = jpegData(compressionQuality: 1.0) else { return 0.0 }
        let bytes = Double(imageData.count)
        return bytes / (1024 * 1024)
    }

    class func image(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        UIGraphicsImageRenderer(size: size).image { rendererContext in
            color.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }

    func fixOrientation() -> UIImage {
        if imageOrientation == .up {
            return self
        }

        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        draw(in: rect)
        let normalizedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return normalizedImage
    }

    func blurred(
        withRadius radius: CGFloat = 5.0,
        completion: @escaping (UIImage?) -> Void
    ) {
        DispatchQueue.global(qos: .userInteractive).async {
            let context = CIContext()

            let currentFilter = CIFilter(name: "CIGaussianBlur")
            guard let beginImage = CIImage(image: self) else {
                return completion(nil)
            }
            currentFilter?.setValue(beginImage, forKey: kCIInputImageKey)
            currentFilter?.setValue(radius, forKey: kCIInputRadiusKey)

            let cropFilter = CIFilter(name: "CICrop")
            cropFilter?.setValue(currentFilter?.outputImage, forKey: kCIInputImageKey)
            cropFilter?.setValue(CIVector(cgRect: beginImage.extent), forKey: "inputRectangle")

            guard let output = cropFilter?.outputImage,
                  let cgImage = context.createCGImage(output, from: output.extent)
            else {
                return completion(nil)
            }

            let processedImage = UIImage(cgImage: cgImage)

            return completion(processedImage)
        }
    }

    
    /// Returns a compressed data object that contains the image in JPEG format.
    /// - Parameter toTargetSize: target size in megabytes of the image
    func jpegDataCompressed(toTargetSize targetSize: Double) -> Data? {
        let currentSize = megabytesSize
        let compressQuality = currentSize <= targetSize ? 1 : targetSize / currentSize
        let imageData = jpegData(compressionQuality: compressQuality)
        return imageData
    }
}
