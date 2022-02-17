//
//  ViewController.swift
//  ImageTest
//
//  Created by DB-MBP-014 on 15/02/22.
//

import UIKit
import CustomImage
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var imgV2: UIImageView!
    @IBOutlet weak var imgView1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let imgs = ImageSize()
        
        imgV2.image = imgs.imageWithImage(image: UIImage(named: "apple")!, scaleToSize: CGSize(width: 150, height: 150), isAspectRation: true)
        
        print(imgV2.image!)
        
        imgView1.image  = imgs.rotate(radians:.pi, newSize: CGSize(width: 150, height: 150), image: UIImage(named: "apple")!)
        
        
//        let image = UIImage(named: "apple")
//        let targetSize = CGSize(width: 15, height: 15)
//
//        let scaledImage = image!.scalePreservingAspectRatio(
//            targetSize: targetSize
//        )
//        imgView1.image = scaledImage
//        imgView1.contentMode = .scaleAspectFit
        // Do any additional setup after loading the view.
    }


}

extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
}
