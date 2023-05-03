//
//  ViewController.swift
//  Paper doll
//
//  Created by 陳佩琪 on 2023/5/1.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var screenView: UIView!
    //下半層
    @IBOutlet weak var lowerView: UIView! // itemScrollView base
    @IBOutlet weak var menuBaseView: UIView! // menuScrollView base

    
    @IBOutlet var itemsScrollView: UIScrollView!
    var itemViews = UIView()
    
    @IBOutlet var menuScrollView: UIScrollView!
    
    
    @IBOutlet weak var hairAccItemsView: UIView!
    @IBOutlet weak var earringView: UIView!
    @IBOutlet var outfitItemsView: UIView!
    @IBOutlet var hairItemsView: UIView!
    @IBOutlet var handItemsView: UIView!
    @IBOutlet var shoesItemsView: UIView!
    @IBOutlet var backgroundItemsView: UIView!
    
    @IBOutlet var menuView: UIView!
    
    
    //IBOutlet collections
        
    @IBOutlet var earringButtons: [UIButton]!
    
    @IBOutlet var hairAccButtons: [UIButton]!
    
    @IBOutlet var hairButtons: [UIButton]!
    
    @IBOutlet var outfitButtons: [UIButton]!
    
    @IBOutlet var handButtons: [UIButton]!
    
    @IBOutlet var shoesButtons: [UIButton]!
    
    @IBOutlet var menuButtons: [UIButton]!
    
    @IBOutlet var backgroundButtons: [UIButton]!
    
    
//上半層
    
    @IBOutlet weak var dollView: UIView!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var hairImageView: UIImageView!
    
    @IBOutlet weak var shoesImageView: UIImageView!
    
    @IBOutlet weak var outfitImageView: UIImageView!
    
    @IBOutlet weak var hairAccImageView: UIImageView!
    
    @IBOutlet weak var earringsImageView: UIImageView!
    
    @IBOutlet weak var handImageView: UIImageView!
    
    @IBOutlet weak var upperView: UIView!
    
    @IBOutlet weak var toolView: UIView!
    
    @IBOutlet weak var buttomToolView: UIView!
    
    @IBOutlet weak var sliderToolView: UIView!
    
    //doll hair color
    var hair000 = ["hair0000"]
    var hair010 = ["hair0100","hair0101","hair0102","hair0103","hair0104","hair0105"]
    var hair020 = ["hair0200","hair0201","hair0202","hair0203","hair0204","hair0205"]
    var hair030 = ["hair0300","hair0301","hair0302","hair0303","hair0304","hair0305"]
    var hair040 = ["hair0400","hair0401","hair0402"]
    var hair050 = ["hair0500","hair0501"]
    var hair060 = ["hair0600","hair0601"]
    var hair070 = ["hair0700"]
    var hair080 = ["hair0800"]
    var hair090 = ["hair0900"]

    
    var indexforColor = 0
    
    @IBOutlet weak var switchColorButtonNext: UIButton!
    @IBOutlet weak var switchColorButtonLast: UIButton!
    @IBOutlet weak var switchColorPageControl: UIPageControl!
    
    @IBOutlet weak var backgroundAlpha: UISlider!
    
    //隨機 & 完成
    @IBOutlet weak var random: UIButton!
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var popUp: UIButton!
    @IBOutlet weak var closePopUp: UIButton!
    
    let darkPink = UIColor(red: 181/255, green: 88/255, blue: 88/255, alpha: 1)
    let lightPink = UIColor(red: 200/255, green: 141/255, blue: 138/255, alpha: 1)
    
    //隱藏 status bar
    override var prefersStatusBarHidden: Bool {
            return true
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        

        
//下半層
        //Menu ScorllView
        menuScrollView = UIScrollView(frame: view.bounds)
        menuScrollView.backgroundColor = lightPink
        menuScrollView.contentSize = menuView.bounds.size
        menuScrollView.addSubview(menuView)
        menuBaseView.addSubview(menuScrollView)
        menuScrollView.frame = CGRect(x:0,y:0,width: 116,height: 400)
        for (index, button) in menuButtons.enumerated() {
            if index == 0 {
                button.backgroundColor = darkPink
            } else {
                button.backgroundColor = lightPink
            }
        }
        
        //Items ScorllView
        itemsScrollView = UIScrollView(frame: view.bounds)
        itemsScrollView.backgroundColor = darkPink
        itemsScrollView.contentSize = hairItemsView.bounds.size
        itemsScrollView.addSubview(hairItemsView)
        lowerView.addSubview(itemsScrollView)
        itemsScrollView.frame = CGRect(x:0,y:0,width: 274,height: 400)
        
        
        //ItemViews 樣式
        hairAccItemsView.backgroundColor = darkPink
        earringView.backgroundColor = darkPink
        outfitItemsView.backgroundColor = darkPink
        hairItemsView.backgroundColor = darkPink
        handItemsView.backgroundColor = darkPink
        shoesItemsView.backgroundColor = darkPink
        backgroundItemsView.backgroundColor = darkPink
        

        //按鈕樣式
        func setButtonBackgroundColor(buttonsCollection: [UIButton]) {
            buttonsCollection.forEach { button in
                button.backgroundColor = UIColor(white: 1, alpha: 0.18)
                button.layer.cornerRadius = 20
                button.clipsToBounds = true
            }
        }
        setButtonBackgroundColor(buttonsCollection: hairButtons)
        setButtonBackgroundColor(buttonsCollection: outfitButtons)
        setButtonBackgroundColor(buttonsCollection: hairAccButtons)
        setButtonBackgroundColor(buttonsCollection: earringButtons)
        setButtonBackgroundColor(buttonsCollection: shoesButtons)
        setButtonBackgroundColor(buttonsCollection: handButtons)
        setButtonBackgroundColor(buttonsCollection: backgroundButtons)
        
            
        //妝髮
        for (index, button) in hairButtons.enumerated() {
            let imageName = "hair" + String(format: "%02d"+"00", index + 1)
            button.setImage(UIImage(named: imageName), for: .normal)
            button.setTitle("", for: .normal)
        }
        
        //衣服
        importItems(buttonCollection: outfitButtons, nameString: "outfit")
        
        //髮飾
        importItems(buttonCollection: hairAccButtons, nameString: "accessories")
        
        //耳環
        importItems(buttonCollection: earringButtons, nameString: "earring")
        
        //鞋子
        importItems(buttonCollection: shoesButtons, nameString: "shoes")
        
        //手持
        importItems(buttonCollection: handButtons, nameString: "hand")
        
        //背景
        importItems(buttonCollection: backgroundButtons, nameString: "bg")
        
        //選單
        importItems(buttonCollection: menuButtons, nameString: "menu")
        
        
        
        
//上半層
        //階層
        upperView.addSubview(backgroundImageView)
        upperView.addSubview(dollView)
        dollView.addSubview(hairImageView)
        dollView.addSubview(shoesImageView)
        dollView.addSubview(outfitImageView)
        dollView.addSubview(hairAccImageView)
        dollView.addSubview(earringsImageView)
        dollView.addSubview(handImageView)
        upperView.addSubview(toolView)
        toolView.addSubview(buttomToolView)
        toolView.addSubview(sliderToolView)
        
        
        //位置
        dollView.frame = CGRect(x: 68.5, y: 36, width: 253, height: 380)
            dollView.backgroundColor = UIColor.clear
        hairImageView.frame = CGRect(x: 0, y: 0, width: 253, height: 362.5)
        shoesImageView.frame = CGRect(x: 75, y: 312.5, width: 103, height: 45)
        outfitImageView.frame = CGRect(x: 37.5, y: 217.5, width: 178, height: 150)
        hairAccImageView.frame = CGRect(x: 1.5, y: 50, width: 250, height: 200)
        earringsImageView.frame = CGRect(x: 42.5, y: 180, width: 167.5, height: 92.5)
        handImageView.frame = CGRect(x: 0, y: 200, width: 100, height: 111.25)
        
        upperView.frame = CGRect(x: 0, y: 0, width: 390, height: 444)
        backgroundImageView.frame = CGRect(x: 0, y: -340, width: 390, height: 844)
        
        //default doll
        hairImageView.image = UIImage(named: "hair0000")
        
        //tool view & bottom tool view
        toolView.frame = CGRect(x: 0, y: 0, width: 390, height: 444)
        toolView.backgroundColor = UIColor.clear
        
        buttomToolView.frame = CGRect(x: 86.5, y: 400, width: 217, height: 35)
        buttomToolView.backgroundColor = UIColor(white: 1, alpha: 0.6)
        buttomToolView.layer.cornerRadius = 20
        
        sliderToolView.frame = CGRect(x: 86.5, y: 400, width: 217, height: 35)
        sliderToolView.backgroundColor = UIColor(white: 1, alpha: 0.6)
        sliderToolView.layer.cornerRadius = 20
        
        
        //切換顏色按鈕
        buttomToolView.isHidden = true
        buttomToolView.addSubview(switchColorButtonLast)
        buttomToolView.addSubview(switchColorButtonNext)
        buttomToolView.addSubview(switchColorPageControl)
        
        sliderToolView.isHidden = true
        sliderToolView.addSubview(backgroundAlpha)
        
         
        
        switchColorButtonLast.frame = CGRect(x: 2, y: 0, width:75 , height: 35)
        switchColorButtonNext.frame = CGRect(x: 140, y:0 , width:75 , height: 35)
        switchColorPageControl.frame = CGRect(x: 50.5, y: 5, width: 116, height: 26)
        
        switchColorButtonNext.setImage(UIImage(systemName: "arrowtriangle.right.fill"), for: .normal)
        switchColorButtonLast.setImage(UIImage(systemName: "arrowtriangle.left.fill"), for: .normal)
        switchColorButtonLast.tintColor = darkPink
        switchColorButtonNext.tintColor = darkPink
        switchColorPageControl.currentPageIndicatorTintColor = darkPink
        switchColorPageControl.pageIndicatorTintColor = lightPink
        
        backgroundAlpha.frame = CGRect(x: 13.5, y: 2.75 , width: 190, height: 30)
        backgroundAlpha.maximumTrackTintColor = UIColor.white
        backgroundAlpha.minimumTrackTintColor = lightPink
        backgroundAlpha.thumbTintColor = darkPink
        
        
        //隨機 & 重設 & 完成
        toolView.addSubview(random)
        random.frame = CGRect(x: 340, y: 390, width: 40, height: 40)
        random.setImage(UIImage(systemName: "shuffle", withConfiguration: UIImage.SymbolConfiguration(weight: .medium)), for: .normal)
        random.tintColor = darkPink
        random.layer.cornerRadius = 20
        random.clipsToBounds = true
        
        toolView.addSubview(reset)
        reset.frame = CGRect(x: 340, y: 290, width: 40, height: 40)
        reset.setImage(UIImage(systemName: "arrow.uturn.left", withConfiguration: UIImage.SymbolConfiguration(weight: .medium)), for: .normal)
        reset.tintColor = darkPink
        reset.layer.cornerRadius = 20
        reset.clipsToBounds = true
        
        toolView.addSubview(popUp)
        popUp.frame = CGRect(x: 340, y: 340, width: 40, height: 40)
        popUp.setImage(UIImage(systemName: "viewfinder", withConfiguration: UIImage.SymbolConfiguration(weight: .medium)), for: .normal)
        popUp.tintColor = darkPink
        popUp.layer.cornerRadius = 20
        popUp.clipsToBounds = true
        
        closePopUp.frame = CGRect(x: 0, y: 0, width: 390, height: 844)
        closePopUp.isHidden = true
        screenView.addSubview(closePopUp)


    }
         
        

 
    //批次匯入
    func importItems(buttonCollection: [UIButton], nameString: String) {
        for (index, button) in buttonCollection.enumerated() {
            let imageName = nameString + String(format: "%02d", index + 1)
            button.setImage(UIImage(named: imageName), for: .normal)
            button.setTitle("", for: .normal)
            button.contentMode = .scaleAspectFill
        }
            
    }

    
    
    //切換選單
    func replaceItemsScrollView(itemViews: UIView, sender: UIButton) {
        itemsScrollView = UIScrollView(frame: view.bounds)
        itemsScrollView.backgroundColor = darkPink
        itemsScrollView.contentSize = itemViews.bounds.size
        itemsScrollView.addSubview(itemViews)
        lowerView.addSubview(itemsScrollView)
        itemsScrollView.frame = CGRect(x:0,y:0,width: 274,height: 400)
        //menu button color
        for button in menuButtons {
            if button == sender {
                button.backgroundColor = darkPink
            } else {
                button.backgroundColor = lightPink
            }
        }
        
    }
    
    
    @IBAction func menuSwitchToHair(_ sender: UIButton) {
        replaceItemsScrollView(itemViews: hairItemsView, sender: sender)
        buttomToolView.isHidden = false
        sliderToolView.isHidden = true
    }
    

    @IBAction func menuSwitchToOutfit(_ sender: UIButton) {
        replaceItemsScrollView(itemViews: outfitItemsView, sender: sender)
        buttomToolView.isHidden = true
        sliderToolView.isHidden = true
    }
    
    @IBAction func menuSwitchToHairAcc(_ sender: UIButton) {
        replaceItemsScrollView(itemViews: hairAccItemsView, sender: sender)
        buttomToolView.isHidden = true
        sliderToolView.isHidden = true
    }
    
    
    @IBAction func menuSwitchToEarrings(_ sender: UIButton) {
        replaceItemsScrollView(itemViews: earringView, sender: sender)
        buttomToolView.isHidden = true
        sliderToolView.isHidden = true
    }
    
    @IBAction func menuSwitchToShoes(_ sender: UIButton) {
        replaceItemsScrollView(itemViews:shoesItemsView, sender: sender)
        buttomToolView.isHidden = true
        sliderToolView.isHidden = true
    }
    
    @IBAction func menuSwitchToHand(_ sender: UIButton) {
        replaceItemsScrollView(itemViews:handItemsView, sender: sender)
        buttomToolView.isHidden = true
        sliderToolView.isHidden = true
    }
    
    @IBAction func menuSwitchToBackground(_ sender: UIButton) {
        replaceItemsScrollView(itemViews:backgroundItemsView, sender: sender)
        buttomToolView.isHidden = true
        sliderToolView.isHidden = false
    }
    
    
    
//換裝按鈕
    
    //hair
    @IBAction func changeHair(_ sender: UIButton) {
        hairImageView.image = sender.currentImage
        indexforColor = 0
        //07-09 隱藏變色按鈕
        if hairImageView.image == UIImage(named: "hair0700") || hairImageView.image == UIImage(named: "hair0800") || hairImageView.image == UIImage(named: "hair0900") {
            buttomToolView.isHidden = true
        } else {
            buttomToolView.isHidden = false
        }
    }
    @IBAction func clearHair(_ sender: Any) {
        hairImageView.image = UIImage(named: "hair0000")
    }
    
    //outfit
    @IBAction func changeOutfit(_ sender: UIButton) {
        outfitImageView.image = sender.currentImage
    }
    @IBAction func clearOutfit(_ sender: Any) {
        outfitImageView.image = nil
    }
    
    //hairAcc
    @IBAction func changeHairAcc(_ sender: UIButton) {
        hairAccImageView.image = sender.currentImage
    }
    @IBAction func clearHairAcc(_ sender: Any) {
        hairAccImageView.image = nil
    }
    
    
    //earrings
    @IBAction func changeEarrings(_ sender: UIButton) {
        earringsImageView.image = sender.currentImage
    }
    @IBAction func clearEarrings(_ sender: Any) {
        earringsImageView.image = nil
    }
    
    //shoes
    @IBAction func changeShoes(_ sender: UIButton) {
        shoesImageView.image = sender.currentImage
    }
    @IBAction func clearShoes(_ sender: Any) {
        shoesImageView.image = nil
    }
    
    //hand
    
    @IBAction func changeHand(_ sender: UIButton) {
        handImageView.image = sender.currentImage
    }
    @IBAction func clearHand(_ sender: Any) {
        handImageView.image = nil
    }
    
    
    //background
    @IBAction func changeBackground(_ sender: UIButton) {
        backgroundImageView.image = sender.currentImage
    }
    @IBAction func clearBackground(_ sender: Any) {
        backgroundImageView.image = nil
    }
    
    
    // hair 換髮色
    
    func switchColorPage(next: Bool,colorHairGroup: [String]) {
        if next == true {
            indexforColor = ( indexforColor + 1 ) % colorHairGroup.count
            hairImageView.image = UIImage(named: colorHairGroup[indexforColor])
            switchColorPageControl.numberOfPages = colorHairGroup.count
        } else {
            indexforColor = ( indexforColor + colorHairGroup.count - 1 ) % colorHairGroup.count
            hairImageView.image = UIImage(named: colorHairGroup[indexforColor])
            switchColorPageControl.numberOfPages = colorHairGroup.count
        }
    }
    
    func changeHairColorImage(next: Bool,colorHairGroup1: [String],colorhairGroup2:[String],colorhairGroup3:[String],colorhairGroup4:[String],colorhairGroup5:[String],colorhairGroup6:[String]) {
        if hairImageView.image == UIImage(named: colorHairGroup1[indexforColor]) {
            switchColorPage(next: next, colorHairGroup: colorHairGroup1)
        } else if hairImageView.image == UIImage(named: colorhairGroup2[indexforColor]) {
            switchColorPage(next: next, colorHairGroup: colorhairGroup2)
        }else if hairImageView.image == UIImage(named: colorhairGroup3[indexforColor]) {
            switchColorPage(next: next, colorHairGroup: colorhairGroup3)
        }else if hairImageView.image == UIImage(named: colorhairGroup4[indexforColor]) {
            switchColorPage(next: next, colorHairGroup: colorhairGroup4)
        }else if hairImageView.image == UIImage(named: colorhairGroup5[indexforColor]) {
            switchColorPage(next: next, colorHairGroup: colorhairGroup5)
        }else if hairImageView.image == UIImage(named: colorhairGroup6[indexforColor]) {
            switchColorPage(next: next, colorHairGroup: colorhairGroup6)
        }
        switchColorPageControl.currentPage = indexforColor
        print(indexforColor)
    }
    
    
    @IBAction func switchColorNext(_ sender: Any) {
        changeHairColorImage(next: true, colorHairGroup1: hair010, colorhairGroup2: hair020, colorhairGroup3: hair030, colorhairGroup4: hair040, colorhairGroup5: hair050, colorhairGroup6: hair060)
    }
          
    
    @IBAction func switchColorLast(_ sender: Any) {
        changeHairColorImage(next: false, colorHairGroup1: hair010, colorhairGroup2: hair020, colorhairGroup3: hair030, colorhairGroup4: hair040, colorhairGroup5: hair050, colorhairGroup6: hair060)
    }
    
    
    func switchHairColorImage(UIImageName: String) {
        indexforColor = switchColorPageControl.currentPage
        hairImageView.image = UIImage(named: UIImageName + "\(indexforColor)")
    }
    
    
    @IBAction func switchPageControl(_ sender: UIPageControl) {
        if hairImageView.image == UIImage(named: "hair010\(indexforColor)"){
            switchHairColorImage(UIImageName: "hair010")
        } else if hairImageView.image == UIImage(named: "hair020\(indexforColor)"){
            switchHairColorImage(UIImageName: "hair020")
        } else if hairImageView.image == UIImage(named: "hair030\(indexforColor)"){
            switchHairColorImage(UIImageName: "hair030")
        } else if hairImageView.image == UIImage(named: "hair040\(indexforColor)"){
            switchHairColorImage(UIImageName: "hair040")
        } else if hairImageView.image == UIImage(named: "hair050\(indexforColor)"){
            switchHairColorImage(UIImageName: "hair050")
        } else if hairImageView.image == UIImage(named: "hair060\(indexforColor)"){
            switchHairColorImage(UIImageName: "hair060")
        }
            print(indexforColor)

    }
    
    
    //背景彩度
    @IBAction func alterBackgroundAlpha(_ sender: Any) {
        backgroundImageView.alpha =      CGFloat(backgroundAlpha.value)
    }
    
    
    //隨機！
    //例： hair = 1, count = hairColorCount[1] = 6, 0100~0105
    @IBAction func randomButton(_ sender: Any) {
        buttomToolView.isHidden = true
        //hair
        let hairColorCount = [hair000.count,hair010.count,hair020.count,hair030.count,hair040.count,hair050.count,hair060.count,hair070.count,hair080.count,hair090.count]
        print(hairColorCount)

        let hairRandomIndex = Int.random(in: 0...9)
        let hairColorRandomIndex = Int.random(in: 0...(hairColorCount[hairRandomIndex]-1))
        hairImageView.image = UIImage(named: "hair0\(hairRandomIndex)0\(hairColorRandomIndex)")
        
        //outfit
        let outfitRandomIndex = Int.random(in: 0...37)
        outfitImageView.image = UIImage(named: String(format: "outfit%02d", outfitRandomIndex))
        
        //hairAcc
        let haiAccRandomIndex = Int.random(in: 0...30)
        hairAccImageView.image = UIImage(named: String(format: "accessories%02d", haiAccRandomIndex))
        
        //earrings
        let earringsRandomIndex = Int.random(in: 0...9)
        earringsImageView.image = UIImage(named: "earring0\(earringsRandomIndex)")
        
        //shoes
        let shoesRandomIndex = Int.random(in: 0...4)
        shoesImageView.image = UIImage(named: "shoes0\(shoesRandomIndex)")
        
        //hand
        let handRandomIndex = Int.random(in: 0...6)
        handImageView.image = UIImage(named: "hand0\(handRandomIndex)")
         
        
        //background
        let backRandomIndex = Int.random(in: 0...10)
        let imageName = "bg" + String(format: "%02d", backRandomIndex)
        backgroundImageView.image = UIImage(named: imageName)
        
    }
   

    
    
    
    
    //重設
    @IBAction func resetAction(_ sender: Any) {
        buttomToolView.isHidden = true
        sliderToolView.isHidden = true
        hairImageView.image = UIImage(named: "hair0000")
        outfitImageView.image = nil
        hairAccImageView.image = nil
        earringsImageView.image = nil
        shoesImageView.image = nil
        handImageView.image = nil
        backgroundImageView.image = nil
    }
    
    func popUpFrontViews(hide: Bool) {
        menuBaseView.isHidden = hide
        lowerView.isHidden = hide
        toolView.isHidden = hide
    }
        
    
    
    
    @IBAction func poopUpAction(_ sender: Any) {
        popUpFrontViews(hide: true)
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: 390, height: 844)
        dollView.transform = CGAffineTransform(scaleX:1.25, y: 1.25)
        dollView.frame = CGRect(x: 36.875, y: 276, width: 316.25, height: 475)
        closePopUp.isHidden = false
        
    }
    
    
    
    @IBAction func closePopUp(_ sender: Any) {
        dollView.transform = CGAffineTransform(scaleX:1, y: 1)
        dollView.frame = CGRect(x: 68.5, y: 36, width: 253, height: 380)
        
        backgroundImageView.frame = CGRect(x: 0, y: -340, width: 390, height: 844)
        popUpFrontViews(hide: false)
        closePopUp.isHidden = true
        
    }

    
}

