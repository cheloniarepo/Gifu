#if os(iOS) || os(tvOS)
import UIKit
/// A `UIImage` extension that makes it easier to resize the image and inspect its size.
extension UIImage {
  /// Resizes an image instance.
  ///
  /// - parameter size: The new size of the image.
  /// - returns: A new resized image instance.
  func resized(to size: CGSize) -> UIImage {
    shrinkImage(max: max(size.width, size.height))
  }

  /// Resizes an image instance to fit inside a constraining size while keeping the aspect ratio.
  ///
  /// - parameter size: The constraining size of the image.
  /// - returns: A new resized image instance.
  func constrained(by constrainingSize: CGSize) -> UIImage {
    let newSize = size.constrained(by: constrainingSize)
    return resized(to: newSize)
  }

  /// Resizes an image instance to fill a constraining size while keeping the aspect ratio.
  ///
  /// - parameter size: The constraining size of the image.
  /// - returns: A new resized image instance.
  func filling(size fillingSize: CGSize) -> UIImage {
    let newSize = size.filling(fillingSize)
    return resized(to: newSize)
  }

  /// Returns a new `UIImage` instance using raw image data and a size.
  ///
  /// - parameter data: Raw image data.
  /// - parameter size: The size to be used to resize the new image instance.
  /// - returns: A new image instance from the passed in data.
  class func image(with data: Data, size: CGSize) -> UIImage? {
    return UIImage(data: data)?.resized(to: size)
  }

  /// Returns an image size from raw image data.
  ///
  /// - parameter data: Raw image data.
  /// - returns: The size of the image contained in the data.
  class func size(withImageData data: Data) -> CGSize? {
    return UIImage(data: data)?.size
  }
}

extension UIImage {

  func shrinkImage(max: CGFloat) -> UIImage {
    let widthInPixel = size.width * scale
    let heightInPixel = size.height * scale
    if widthInPixel > max || heightInPixel > max {
      if widthInPixel > heightInPixel {
        return resizeImage(CGSize(width: max, height: max / size.width * size.height))
      } else {
        return resizeImage(CGSize(width: max / size.height * size.width, height: max))
      }
    } else {
      return self
    }
  }

  func resizeImage(_ size: CGSize) -> UIImage {
    UIGraphicsImageRenderer(size: size).image { _ in
      draw(in: CGRect(origin: .zero, size: size))
    }
  }

}
#endif
