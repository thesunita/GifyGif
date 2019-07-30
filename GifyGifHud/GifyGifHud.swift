//
//  GifyGifHud.swift
//  GifyGifHud
//
//  Created by daffolapmac-48 on 18/07/19.
//  Copyright © 2019 daffolapmac-48. All rights reserved.
//

import UIKit

public class GifyGifHud: UIView {
    
    public static var options = GifHUDOptions()
    static public let hud = GifyGifHud()
    static private let appWindow = UIApplication.shared.keyWindow
    
    private let loadingView = UIView()
    private let backgroundView = UIView()
    private var imageView = UIImageView()
    
    public var hudSize = 180.0{
        didSet{
            self.setupView()
        }
    }
    
    /// The gif image name.
    public var imageName:String!{
        didSet{
            self.setupView()
        }
    }
    
    public var hudBackground:UIColor = UIColor.white{
        didSet{
            self.setupView()
        }
    }
    
    init() {
        super.init(frame: GifyGifHud.appWindow!.bounds)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        if imageView.superview != nil{
            imageView.removeFromSuperview()
        }
        if loadingView.superview != nil{
            loadingView.removeFromSuperview()
        }
        if backgroundView.superview != nil{
            backgroundView.removeFromSuperview()
        }
        
        initBackgroundView()
        initLoadingView()
    }
    
    private func initBackgroundView() {
        backgroundView.frame = frame
        backgroundView.backgroundColor = GifyGifHud.options.overlayBackgroundColor
        backgroundView.alpha = GifyGifHud.options.backgroundAlpha
        addSubview(backgroundView)
    }
    
    private func initLoadingView() {
        let insetValueX = frame.midX - CGFloat(self.hudSize/2)
        let insetValueY = frame.midY - CGFloat(self.hudSize/2)
        loadingView.frame = frame.insetBy(dx: insetValueX, dy: insetValueY)
        loadingView.backgroundColor = self.hudBackground
        loadingView.layer.cornerRadius = GifyGifHud.options.cornerRadius
        loadingView.clipsToBounds = true
        addSubview(loadingView)
        self.imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: loadingView.frame.size.width, height: loadingView.frame.size.height))
        self.imageView.contentMode = GifyGifHud.options.contentMode
        if let _ = self.imageName{
            self.imageView.loadGif(name: self.imageName)
        }else{
            self.imageView.loadGif(name: "loader")
        }
        
        loadingView.addSubview(self.imageView)
        
    }
    
    public static func show() {
        if GifyGifHud.hud.superview == nil {
            appWindow?.addSubview(GifyGifHud.hud)
        }
    }
    
    public static func dismiss() {
        if GifyGifHud.hud.superview != nil {
            GifyGifHud.hud.removeFromSuperview()
        }
    }
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //if AMProgressHUD.options.cancable {
            removeFromSuperview()
        //}
    }

}
public class GifHUDOptions {
    /// The duration for the gif image animation, the defualt is `0`.
    public var animationDuration = 1.0
    /// The repeat count for the gif image, the default is `0` (Infinity).
    public var animationRepeatCount = 0
    /// Background color for the loading view, the default is `white`.
    public var overlayBackgroundColor = UIColor.black
    
    /// The alpha for the background of the black view below the loading view, the default is `0`.
    public var backgroundAlpha:CGFloat = 0.2
    /// The corner radius of the loading view, the default is `0`.
    public var cornerRadius:CGFloat = 10
    
    /// To determine if the loading view cancelable or not, the defualt is `false`.
    public var cancable = false
    /// The gif `imageview` content mode, the defualt is `scaleAspectFit`.
    public var contentMode: UIView.ContentMode = .scaleAspectFit
    //The HudSize as CGFloat, default is 180.0
    
}
