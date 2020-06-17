//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import AVFoundation

class Menu : UIViewController {
	var text1 = "\nHi there human! I’m Pon the River Otter 🦦. \nI spend most of my time reading books or play fishing games in my tablet \nand often forgot about time once i'm doing what i love.\nBy the way, I have a question for you..."
	
    var text2 = "\nHave you ever noticed that your eyes feels tired or blurry \nafter hours staring on the screen or reading books? \nI Have! And... "
	
    var text3 = "\nI'm here to share my tips, some simple and easy eyes exercise.\nIt's nice for eyes comfort \nAre you ready for it human? \nGive me a high five!"
    var state = 1
    
    override func loadView() {
        super.loadView()
        setupViews()
    }
    
    
    func setupViews() {
        view.backgroundColor = .white
        let imageBlured = UIImageView.init(image: UIImage.init(named: "room-blur.jpg"))
        imageBlured.translatesAutoresizingMaskIntoConstraints = false
        imageBlured.alpha = 1
        imageBlured.contentMode = .scaleAspectFit
        self.view.addSubview(imageBlured)
        imageBlured.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        imageBlured.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        imageBlured.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        imageBlured.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
//---------> Change wave for first picture
        let image = UIImageView.init(image: UIImage.init(named: "pon-bananapad.png"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        let tap = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gestureReconizer:)))
        tap.minimumPressDuration = 0
        image.addGestureRecognizer(tap)
        image.isUserInteractionEnabled = true
        image.tag = 100
        
        view.addSubview(image)
        image.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        image.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 70).isActive = true
        image.heightAnchor.constraint(equalToConstant: 450).isActive = true
        let button1 = UIButton.init()
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitle("Near and Far", for: .normal)
        button1.setTitleColor(.white, for: .normal)
        button1.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button1.backgroundColor = .brown
        button1.layer.cornerRadius = 20
        button1.layer.shadowColor = UIColor.black.cgColor
        button1.layer.shadowOpacity = 0.5
        button1.layer.shadowOffset = .init(width: 0, height: 1)
        button1.layer.shadowRadius = 4
        button1.contentEdgeInsets = .init(top: 12, left: 8, bottom: 12, right: 8)
        button1.addTarget(self, action: #selector(nextPage1), for: .touchUpInside)
        button1.addTarget(self, action: #selector(clickButton), for: .touchDown)
        
        let button2 = UIButton.init()
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setTitle("Left and Right", for: .normal)
        button2.setTitleColor(.white, for: .normal)
        button2.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button2.backgroundColor = .brown
        button2.layer.cornerRadius = 20
        button2.layer.shadowColor = UIColor.black.cgColor
        button2.layer.shadowOpacity = 0.5
        button2.layer.shadowOffset = .init(width: 0, height: 1)
        button2.layer.shadowRadius = 4
        button2.contentEdgeInsets = .init(top: 12, left: 8, bottom: 12, right: 8)
        button2.addTarget(self, action: #selector(nextPage2), for: .touchUpInside)
        button2.addTarget(self, action: #selector(clickButton), for: .touchDown)
        
        let button3 = UIButton.init()
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.setTitle("Up and Down", for: .normal)
        button3.setTitleColor(.white, for: .normal)
        button3.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button3.backgroundColor = .brown
        button3.layer.cornerRadius = 20
        button3.layer.shadowColor = UIColor.black.cgColor
        button3.layer.shadowOpacity = 0.5
        button3.layer.shadowOffset = .init(width: 0, height: 1)
        button3.layer.shadowRadius = 4
        button3.contentEdgeInsets = .init(top: 12, left: 8, bottom: 12, right: 8)
        button3.addTarget(self, action: #selector(nextPage3), for: .touchUpInside)
        button3.addTarget(self, action: #selector(clickButton), for: .touchDown)
        
        let buttonStack = UIStackView.init(arrangedSubviews: [button1, button2, button3])
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.alignment = .fill
        buttonStack.axis = .horizontal
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 32
        self.view.addSubview(buttonStack)
        buttonStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 68).isActive = true
        buttonStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        buttonStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 64).isActive = true
        buttonStack.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        
        let boxText = UITextView()
        boxText.translatesAutoresizingMaskIntoConstraints = false
        boxText.isScrollEnabled = false
        boxText.isSelectable = false
        boxText.font = .preferredFont(forTextStyle: .headline)
        boxText.text = text1
        boxText.isEditable = false
        boxText.backgroundColor = UIColor(red: 255/256, green: 238/256, blue: 183/256, alpha: 1.0)
        //----- Dialogue text color
        boxText.textColor = UIColor(red: 152/256, green: 74/256, blue: 74/256, alpha: 1.0)
        boxText.tag = 403
        boxText.layer.cornerRadius = 70
        boxText.contentInset = .init(top: 32, left: 32, bottom: 32, right: 32)
        
        let click = UITapGestureRecognizer.init(target: self, action: #selector(boxClick))
        boxText.addGestureRecognizer(click)
        boxText.isUserInteractionEnabled = true
        
        view.addSubview(boxText)
        boxText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32).isActive = true
        boxText.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32).isActive = true
        boxText.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 48).isActive = true
        boxText.heightAnchor.constraint(equalToConstant: 192).isActive = true
        
        //--------- Pon Name Dialog Title
        let nameTag = UIImageView.init(image: UIImage.init(named: "PON name.png"))
        nameTag.translatesAutoresizingMaskIntoConstraints = false
        nameTag.contentMode = .scaleAspectFit
        nameTag.tag = 404
        view.addSubview(nameTag)
        
        nameTag.leadingAnchor.constraint(equalTo: boxText.leadingAnchor, constant: 16).isActive = true
        nameTag.bottomAnchor.constraint(equalTo: boxText.topAnchor, constant: 16).isActive = true
        nameTag.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        
        
        //--------- Continue Text
        let continueText = UILabel.init()
        continueText.translatesAutoresizingMaskIntoConstraints = false
        continueText.contentMode = .scaleAspectFit
        continueText.tag = 406
        continueText.text = "Next ▶︎"
        continueText.textColor = UIColor(red: 152/256, green: 74/256, blue: 74/256, alpha: 1.0)
        continueText.font = .preferredFont(forTextStyle: .headline)
        continueText.alpha = 1
        view.addSubview(continueText)
        
        continueText.trailingAnchor.constraint(equalTo: boxText.trailingAnchor, constant: -48).isActive = true
        continueText.bottomAnchor.constraint(equalTo: boxText.bottomAnchor, constant: -12).isActive = true
        
        //ready button
        let readyButton = UIButton.init()
        readyButton.translatesAutoresizingMaskIntoConstraints = false
        readyButton.setTitle("Ready", for: .normal)
        readyButton.setTitleColor(.white, for: .normal)
        readyButton.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        readyButton.backgroundColor = .red
        readyButton.alpha = 0.75
        readyButton.layer.cornerRadius = 40
        readyButton.tag = 99
        readyButton.addTarget(self, action: #selector(ready), for: .touchUpInside)
        readyButton.addTarget(self, action: #selector(clickButton), for: .touchDown)
        readyButton.isHidden = true
        self.view.addSubview(readyButton)
        readyButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        readyButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        readyButton.topAnchor.constraint(equalTo: image.topAnchor, constant: 36).isActive = true
        readyButton.trailingAnchor.constraint(equalTo: image.trailingAnchor, constant: -120).isActive = true
        
    }
    
    var player: AVAudioPlayer?
    @objc func clickButton() {
        playSound(fileName: "pop-button")
    }
    
    func playSound(fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else { return }
            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    @objc func boxClick() {
        print("Click")
        let otterImage = self.view.viewWithTag(100) as! UIImageView
        let textBox = self.view.viewWithTag(403) as! UITextView
        let readyButton = self.view.viewWithTag(99)!
        let continueButton = self.view.viewWithTag(406)!
//======= Change here for next
       
        if state == 1 {
            // text setelah introduction
            textBox.text = text2
            otterImage.image = UIImage.init(named: "pon-bananapad.png")
             state += 1
        } else if state == 2 {
            // text waktu wave
            textBox.text = text3
            otterImage.image = UIImage.init(named: "pon-bananapad.png")
            readyButton.isHidden = false
            continueButton.isHidden = true
             state += 1
        }
    }
    
    @objc func ready() {
        let textBox = self.view.viewWithTag(403) as! UITextView
        let image = self.view.viewWithTag(404)!
        let continueButton = self.view.viewWithTag(406)!
        let readyButton = self.view.viewWithTag(99)!
        
        readyButton.isHidden = true
        UIView.animate(withDuration: 1.25, animations: {
            image.alpha = 0
            textBox.alpha = 0
            continueButton.alpha = 0
        }) { (isDone) in
            self.state += 1
            image.isHidden = true
            textBox.isHidden = true
            continueButton.isHidden = true
        }
    }
    
    @objc func nextPage1() {
        let vc = EX1()
        self.navigationController?.pushViewController(vc, animated: true)
        animateOtter()
    }
    
    @objc func nextPage2() {
        let vc = EX2()
        self.navigationController?.pushViewController(vc, animated: true)
        animateOtter()
    }
    
    @objc func nextPage3() {
        let vc = EX3()
        self.navigationController?.pushViewController(vc, animated: true)
        animateOtter()
    }
    
    func animateOtter(){
     if let image = self.view.viewWithTag(100) as? UIImageView{
        if otterCycle == 0 {
                   image.image = UIImage.init(named: "pon-sad.png")
                   otterCycle += 1
               } else if otterCycle == 1 {
                   image.image = UIImage.init(named: "pon-down.png")
                   otterCycle += 1
               } else if otterCycle == 2 {
                   image.image = UIImage.init(named: "pon-sus.png")
                   otterCycle += 1
               } else if otterCycle == 3 {
                   image.image = UIImage.init(named: "pon-sleep.png")
                   otterCycle += 1
               } else if otterCycle == 4 {
               image.image = UIImage.init(named: "pon-bananapad.png")
                   otterCycle += 1
               } else if otterCycle == 5 {
			   image.image = UIImage.init(named: "pon-pall.png")
			   otterCycle += 1
				}else if otterCycle == 6 {
                   image.image = UIImage.init(named: "pon-up.png")
                   otterCycle += 1
               } else {
                   image.image = UIImage.init(named: "pon-laugh.png")
                   otterCycle = 0
               }
        }
    }
//======= otter state cycle
    var otterCycle = 0
    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state == .began {
            if state > 3 {
                animateOtter()
                clickButton()
            }
        }
    }
}


/*-------------------------------------------------------------------
//  exercise 1 NEAR AND FAR
//-----------------------------------------------------------------*/
class EX1 : UIViewController {
    let textMessage = "\nThis is my favorite exercise! :3 \nTry focus on an object far away from you, maybe corner of your room \nor a corner of a poster on the wall for 15 seconds, \nthen change your focus to the corner of your screen for 5 seconds. \nRepeat for at least 5 times each near and far focus.\n Also can be at least 1 minute or longer, no need to rush, take your time"
    
    var breakAnimation = false
    var time: Double = 0
    var timer = Timer()
    
    var constClear = NSLayoutConstraint()
    var constBlur = NSLayoutConstraint()
    
    var timerText = UILabel.init()
    
    override func loadView() {
        super.loadView()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        
        
        let image = UIImageView.init(image: UIImage.init(named: "room-clear.jpg"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        self.view.addSubview(image)
        image.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        image.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        image.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        image.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        let imageBlured = UIImageView.init(image: UIImage.init(named: "room-blur.jpg"))
        imageBlured.translatesAutoresizingMaskIntoConstraints = false
        imageBlured.alpha = 1
        imageBlured.contentMode = .scaleAspectFit
        imageBlured.tag = 201
        self.view.addSubview(imageBlured)
        imageBlured.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        imageBlured.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        imageBlured.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        imageBlured.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        //--------- Clear BananaPad
        let bananaPad = UIImageView.init(image: UIImage.init(named: "bananapad-clear.png"))
        bananaPad.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bananaPad)
        bananaPad.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        constClear = bananaPad.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -384)
        constClear.isActive = true
        
        //--------- Blur BananaPad
        let bananaBlur = UIImageView.init(image: UIImage.init(named: "bananapad-blur.png"))
        bananaBlur.tag = 202
        bananaBlur.alpha = 0
        bananaBlur.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bananaBlur)
        bananaBlur.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        constBlur = bananaBlur.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -384)
        constBlur.isActive = true
        
        //--------- Done button
        let button = UIButton.init()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        //Color Text Button Done
        button.setTitleColor(UIColor(red: 152/256, green: 74/256, blue: 74/256, alpha: 1.0), for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button.backgroundColor = UIColor(red: 255/256, green: 238/256, blue: 183/256, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = .init(width: 0, height: 1)
        button.layer.shadowRadius = 4
        button.contentEdgeInsets = .init(top: 12, left: 8, bottom: 12, right: 8)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        button.addTarget(self, action: #selector(clickButton), for: .touchDown)
        button.alpha = 0
        button.tag = 401
        self.view.addSubview(button)
        
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -32).isActive = true
        button.widthAnchor.constraint(greaterThanOrEqualToConstant: 192).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //--------- TIMER
        let text = UILabel.init()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "00:00"
        text.textColor = .white
        text.alpha = 0
        text.tag = 402
        text.font = .preferredFont(forTextStyle: .largeTitle)
        self.view.addSubview(text)
        
        text.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32).isActive = true
        text.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -32).isActive = true
        
        timerText = text
        
        
        let boxText = UITextView()
        boxText.translatesAutoresizingMaskIntoConstraints = false
        boxText.isScrollEnabled = false
        boxText.isSelectable = false
        boxText.font = .preferredFont(forTextStyle: .headline)
        boxText.text = textMessage
        boxText.isEditable = false
        boxText.backgroundColor = UIColor(red: 255/256, green: 238/256, blue: 183/256, alpha: 1.0)
        //----- Dialogue text color
        boxText.textColor = UIColor(red: 152/256, green: 74/256, blue: 74/256, alpha: 1.0)
        boxText.tag = 403
        boxText.layer.cornerRadius = 70
        boxText.contentInset = .init(top: 32, left: 32, bottom: 32, right: 32)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(boxClick))
        boxText.addGestureRecognizer(tap)
        boxText.isUserInteractionEnabled = true
        
        view.addSubview(boxText)
        boxText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32).isActive = true
        boxText.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32).isActive = true
        boxText.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -32).isActive = true
        boxText.heightAnchor.constraint(equalToConstant: 224).isActive = true
        
        //--------- Pon Name Dialog Title
        let nameTag = UIImageView.init(image: UIImage.init(named: "PON name.png"))
        nameTag.translatesAutoresizingMaskIntoConstraints = false
        nameTag.contentMode = .scaleAspectFit
        nameTag.tag = 404
        view.addSubview(nameTag)
        
        nameTag.leadingAnchor.constraint(equalTo: boxText.leadingAnchor, constant: 16).isActive = true
        nameTag.bottomAnchor.constraint(equalTo: boxText.topAnchor, constant: 16).isActive = true
        nameTag.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        //--------- Continue Text
        let continueText = UILabel.init()
        continueText.translatesAutoresizingMaskIntoConstraints = false
        continueText.contentMode = .scaleAspectFit
        continueText.tag = 405
        continueText.text = "Next ▶︎"
        continueText.textColor = UIColor(red: 152/256, green: 74/256, blue: 74/256, alpha: 1.0)
        continueText.font = .preferredFont(forTextStyle: .headline)
        continueText.alpha = 1
        view.addSubview(continueText)
        
        continueText.trailingAnchor.constraint(equalTo: boxText.trailingAnchor, constant: -48).isActive = true
        continueText.bottomAnchor.constraint(equalTo: boxText.bottomAnchor, constant: -12).isActive = true
        
		
		/// near text
		let nearText = UILabel.init()
		nearText.translatesAutoresizingMaskIntoConstraints = false
		nearText.tag = 700
		 nearText.text = "Near"
		nearText.textColor = UIColor(red: 255/256, green: 238/256, blue: 183/256, alpha: 1.0)
		 nearText.font = .preferredFont(forTextStyle: .largeTitle)
		 nearText.alpha = 0
		 view.addSubview(nearText)
		 
		nearText.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -30).isActive = true
		 nearText.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -256).isActive = true
		
		/// far text
		let farText = UILabel.init()
		farText.translatesAutoresizingMaskIntoConstraints = false
		farText.tag = 701
		 farText.text = "Far"
		farText.textColor = UIColor(red: 248/256, green: 107/256, blue: 107/256, alpha: 1.0)
		 farText.font = .preferredFont(forTextStyle: .largeTitle)
		 farText.alpha = 0
		 view.addSubview(farText)
		 
		 farText.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -30).isActive = true
		 farText.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 256).isActive = true
    }
    
    
    var player: AVAudioPlayer?
    @objc func clickButton() {
        playSound(fileName: "pop-button")
    }
    
    func playSound(fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else { return }
            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @objc func boxClick() {
        let button = self.view.viewWithTag(401)!
        let textBox = self.view.viewWithTag(403)!
        let timerText = self.view.viewWithTag(402)!
        let image = self.view.viewWithTag(404)!
        let nextButton = self.view.viewWithTag(405)!
        let bgBlur = self.view.viewWithTag(201) as! UIImageView
        let fwBlur = self.view.viewWithTag(202) as! UIImageView
		
        let near = self.view.viewWithTag(700)!
        
        UIView.animate(withDuration: 1.25, delay: 0, options: .curveLinear, animations: {
            button.alpha = 1
            timerText.alpha = 1
            textBox.alpha = 0
            image.alpha = 0
            nextButton.alpha = 0
			near.alpha = 1
        }) { (done) in
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                textBox.isHidden = true
                image.isHidden = true
                nextButton.isHidden = true
                
                self.runTImer()
                self.animation(bgBlur: bgBlur, fwBlur: fwBlur)
            }
        }
    }
    
    
    func animation(bgBlur: UIImageView, fwBlur: UIImageView) {
        if breakAnimation { return }
		
        let near = self.view.viewWithTag(700)!
        let far = self.view.viewWithTag(701)!
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { ///// delay near
            if self.breakAnimation { return }
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {// animation duration
                
			self.constClear.constant = -376
				self.constBlur.constant = -376
				bgBlur.alpha = 0
				fwBlur.alpha = 1
				far.alpha = 1
				near.alpha = 0
				self.view.layoutIfNeeded()

                print("Done1")
            }) { (isSuccess) in
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // delay far
                    if self.breakAnimation { return }
                    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: { // animation duration
						
						self.constClear.constant = -384
						self.constBlur.constant = -384
						bgBlur.alpha = 1
						fwBlur.alpha = 0
						far.alpha = 0
						near.alpha = 1
						self.view.layoutIfNeeded()

						
                        
                        print("Done2")
                    }) { (isSuccess) in
                        self.animation(bgBlur: bgBlur, fwBlur: fwBlur)
                        print("Done - \(isSuccess)")
                    }
                }
            }
        }
    }
    
    func runTImer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        time += 1
        timerText.text = timeString(time: time)
        if breakAnimation { timer.invalidate() }
    }
    
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i", minutes, seconds)
        
    }
    
    
    @objc func nextPage() {
        breakAnimation = true
        timer.invalidate()
        self.navigationController?.popViewController(animated: true)
    }
}

/*-------------------------------------------------------------------
//  exercise 2 LEFT AND RIGHT
//-------------------------------------------------------------------*/
class EX2 : UIViewController {
    let textMessage = "\nLook left and right repeat 5 times each or at least 1 minute. \nNo need to rush, take your time"
    
    var breakAnimation = false
    var time: Double = 0
    var timer = Timer()
    
    var timerText = UILabel.init()
    
    var xConst: NSLayoutConstraint = .init()
    var yConst: NSLayoutConstraint = .init()
    
    override func loadView() {
        super.loadView()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        //--------- Left Eye
        let leftEye = UIImageView.init(image: UIImage.init(named: "pupil.png"))
        leftEye.translatesAutoresizingMaskIntoConstraints = false
        leftEye.contentMode = .scaleAspectFit
        self.view.addSubview(leftEye)
        yConst = leftEye.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 174)
        xConst = leftEye.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120)
        leftEye.widthAnchor.constraint(equalToConstant: 93).isActive = true
        yConst.isActive = true
        xConst.isActive = true
        
        //--------- Right Eye
        let rightEye = UIImageView.init(image: UIImage.init(named: "pupil.png"))
        rightEye.translatesAutoresizingMaskIntoConstraints = false
        rightEye.contentMode = .scaleAspectFit
        self.view.addSubview(rightEye)
        rightEye.topAnchor.constraint(equalTo: leftEye.topAnchor, constant: 0).isActive = true
        rightEye.leadingAnchor.constraint(equalTo: leftEye.trailingAnchor, constant: 291).isActive = true
        rightEye.widthAnchor.constraint(equalToConstant: 93).isActive = true
        //--------- Face
        let bgFace = UIImageView.init(image: UIImage.init(named: "Wajah.png"))
        bgFace.translatesAutoresizingMaskIntoConstraints = false
        bgFace.contentMode = .scaleAspectFit
        bgFace.alpha = 1
        self.view.addSubview(bgFace)
        bgFace.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        bgFace.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        bgFace.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        bgFace.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        //--------- Mouth
        let bgNose = UIImageView.init(image: UIImage.init(named: "Mouth.png"))
        bgNose.translatesAutoresizingMaskIntoConstraints = false
        bgNose.alpha = 1
        bgNose.contentMode = .scaleAspectFit
        self.view.addSubview(bgNose)
        bgNose.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 32).isActive = true
        bgNose.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 256).isActive = true
        bgNose.widthAnchor.constraint(equalToConstant: 1080).isActive = true
        bgNose.heightAnchor.constraint(equalToConstant: 720).isActive = true
        
        //--------- Done button
        let button = UIButton.init()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        //Color Text Button Done
        button.setTitleColor(UIColor(red: 152/256, green: 74/256, blue: 74/256, alpha: 1.0), for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button.backgroundColor = UIColor(red: 255/256, green: 238/256, blue: 183/256, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = .init(width: 0, height: 1)
        button.layer.shadowRadius = 4
        button.contentEdgeInsets = .init(top: 12, left: 8, bottom: 12, right: 8)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        button.addTarget(self, action: #selector(clickButton), for: .touchDown)
        button.alpha = 0
        button.tag = 401
        self.view.addSubview(button)
        
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -32).isActive = true
        button.widthAnchor.constraint(greaterThanOrEqualToConstant: 192).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //--------- Timer
        let text = UILabel.init()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "00:00"
        // Timer Text Color
        text.textColor = UIColor(red: 248/256, green: 107/256, blue: 107/256, alpha: 1.0)
        text.font = .preferredFont(forTextStyle: .largeTitle)
        text.alpha = 0
        text.tag = 402
        self.view.addSubview(text)
        
        text.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32).isActive = true
        text.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -32).isActive = true
        
        timerText = text
        
        
        let boxText = UITextView()
        boxText.translatesAutoresizingMaskIntoConstraints = false
        boxText.isScrollEnabled = false
        boxText.isSelectable = false
        boxText.font = .preferredFont(forTextStyle: .headline)
        boxText.text = textMessage
        boxText.isEditable = false
        boxText.backgroundColor = UIColor(red: 255/256, green: 238/256, blue: 183/256, alpha: 1.0)
        //----- Dialogue text color
        boxText.textColor = UIColor(red: 152/256, green: 74/256, blue: 74/256, alpha: 1.0)
        boxText.tag = 403
        boxText.layer.cornerRadius = 70
        boxText.contentInset = .init(top: 32, left: 32, bottom: 32, right: 32)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(boxClick))
        boxText.addGestureRecognizer(tap)
        boxText.isUserInteractionEnabled = true
        
        view.addSubview(boxText)
        boxText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32).isActive = true
        boxText.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32).isActive = true
        boxText.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -32).isActive = true
        boxText.heightAnchor.constraint(equalToConstant: 224).isActive = true
        
        //--------- PON Name Dialogue Title
        let nameTag = UIImageView.init(image: UIImage.init(named: "PON name.png"))
        nameTag.translatesAutoresizingMaskIntoConstraints = false
        nameTag.contentMode = .scaleAspectFit
        nameTag.tag = 404
        view.addSubview(nameTag)
        
        nameTag.leadingAnchor.constraint(equalTo: boxText.leadingAnchor, constant: 16).isActive = true
        nameTag.bottomAnchor.constraint(equalTo: boxText.topAnchor, constant: 16).isActive = true
        nameTag.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        //--------- Continue Text
        let continueText = UILabel.init()
        continueText.translatesAutoresizingMaskIntoConstraints = false
        continueText.contentMode = .scaleAspectFit
        continueText.tag = 405
        continueText.text = "Next ▶︎"
        continueText.textColor = UIColor(red: 152/256, green: 74/256, blue: 74/256, alpha: 1.0)
        continueText.font = .preferredFont(forTextStyle: .headline)
        continueText.alpha = 1
        view.addSubview(continueText)
        
        continueText.trailingAnchor.constraint(equalTo: boxText.trailingAnchor, constant: -48).isActive = true
        continueText.bottomAnchor.constraint(equalTo: boxText.bottomAnchor, constant: -12).isActive = true
        
        
    }
    var player: AVAudioPlayer?
    @objc func clickButton() {
        playSound(fileName: "pop-button")
    }
    
    func playSound(fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else { return }
            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @objc func boxClick() {
        print("Click")
        
        let button = self.view.viewWithTag(401)!
        let label = self.view.viewWithTag(402)!
        let textBox = self.view.viewWithTag(403)!
        let image = self.view.viewWithTag(404)!
        let nextButton = self.view.viewWithTag(405)!
        
        UIView.animate(withDuration: 1.25, delay: 0, options: .curveLinear, animations: {
            button.alpha = 1
            label.alpha = 1
            textBox.alpha = 0
            image.alpha = 0
            nextButton.alpha = 0
        }) { (done) in
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                textBox.isHidden = true
                image.isHidden = true
                nextButton.isHidden = true
                
                self.runTImer()
                self.animation(leftEyeConstX: self.xConst, leftEyeConstY: self.yConst)
            }
        }
    }
    
    
    func animation(leftEyeConstX: NSLayoutConstraint, leftEyeConstY: NSLayoutConstraint) {
        if breakAnimation { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            if self.breakAnimation { return }
            UIView.animate(withDuration: 1.25, delay: 0, options: .curveEaseInOut, animations: {
                leftEyeConstX.constant = 40
                self.view.layoutIfNeeded()
                print("Done1")
            }) { (isSuccess) in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if self.breakAnimation { return }
                    UIView.animate(withDuration: 2.5, delay: 0, options: .curveEaseInOut, animations: {
                        leftEyeConstX.constant = 198
                        self.view.layoutIfNeeded()
                        print("Done2")
                    }) { (isSuccess) in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            if self.breakAnimation { return }
                            UIView.animate(withDuration: 1.25, delay: 0, options: .curveEaseInOut, animations: {
                                leftEyeConstX.constant = 120
                                self.view.layoutIfNeeded()
                                print("Done3")
                            }) { (isSuccess) in
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    if self.breakAnimation { return }
                                    self.animation(leftEyeConstX: leftEyeConstX, leftEyeConstY: leftEyeConstY)
                                }
                                print("Done - \(isSuccess)")
                            }
                        }
                        print("Done - \(isSuccess)")
                    }
                }
            }
        }
    }
    
    func runTImer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        time += 1
        timerText.text = timeString(time: time)
        if breakAnimation { timer.invalidate() }
    }
    
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i", minutes, seconds)
        
    }
    
    
    @objc func nextPage() {
        breakAnimation = true
        timer.invalidate()
        self.navigationController?.popViewController(animated: true)
    }
}

/*-------------------------------------------------------------------
++ exercise 3 UP AND DOWN
++-----------------------------------------------------------------*/
class EX3 : UIViewController {
    let textMessage = "\nLook up and down repeat 5 times each or at least 1 minute. \nNo need to rush, take your time"
    
    var breakAnimation = false
    var time: Double = 0
    var timer = Timer()
    
    var timerText = UILabel.init()
    
    var xConst: NSLayoutConstraint = .init()
    var yConst: NSLayoutConstraint = .init()
    
    override func loadView() {
        super.loadView()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        
        //--------- Left Eye
        let leftEye = UIImageView.init(image: UIImage.init(named: "pupil.png"))
        leftEye.translatesAutoresizingMaskIntoConstraints = false
        leftEye.contentMode = .scaleAspectFit
        self.view.addSubview(leftEye)
        yConst = leftEye.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 174)
        xConst = leftEye.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 120)
        leftEye.widthAnchor.constraint(equalToConstant: 93).isActive = true
        yConst.isActive = true
        xConst.isActive = true
        
        //--------- Right Eye
        let rightEye = UIImageView.init(image: UIImage.init(named: "pupil.png"))
        rightEye.translatesAutoresizingMaskIntoConstraints = false
        rightEye.contentMode = .scaleAspectFit
        self.view.addSubview(rightEye)
        rightEye.topAnchor.constraint(equalTo: leftEye.topAnchor, constant: 0).isActive = true
        rightEye.leadingAnchor.constraint(equalTo: leftEye.trailingAnchor, constant: 291).isActive = true
        rightEye.widthAnchor.constraint(equalToConstant: 93).isActive = true
        
        let bgFace = UIImageView.init(image: UIImage.init(named: "Wajah.png"))
        bgFace.translatesAutoresizingMaskIntoConstraints = false
        bgFace.contentMode = .scaleAspectFit
        bgFace.alpha = 1
        self.view.addSubview(bgFace)
        bgFace.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        bgFace.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        bgFace.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        bgFace.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        //--------- Mouth
        let bgNose = UIImageView.init(image: UIImage.init(named: "Mouth.png"))
        bgNose.translatesAutoresizingMaskIntoConstraints = false
        bgNose.alpha = 1
        bgNose.contentMode = .scaleAspectFit
        self.view.addSubview(bgNose)
        bgNose.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 32).isActive = true
        bgNose.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 256).isActive = true
        bgNose.widthAnchor.constraint(equalToConstant: 1080).isActive = true
        bgNose.heightAnchor.constraint(equalToConstant: 720).isActive = true
        
        //--------- Done button
        let button = UIButton.init()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        //Color Text Button Done
        button.setTitleColor(UIColor(red: 152/256, green: 74/256, blue: 74/256, alpha: 1.0), for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        button.backgroundColor = UIColor(red: 255/256, green: 238/256, blue: 183/256, alpha: 1.0)
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = .init(width: 0, height: 1)
        button.layer.shadowRadius = 4
        button.contentEdgeInsets = .init(top: 12, left: 8, bottom: 12, right: 8)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        button.addTarget(self, action: #selector(clickButton), for: .touchDown)
        button.alpha = 0
        button.tag = 401
        self.view.addSubview(button)
        
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -32).isActive = true
        button.widthAnchor.constraint(greaterThanOrEqualToConstant: 192).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //---------  Timer
        let text = UILabel.init()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "00:00"
        // Timer Text Color
        text.textColor = UIColor(red: 248/256, green: 107/256, blue: 107/256, alpha: 1.0)
        text.font = .preferredFont(forTextStyle: .largeTitle)
        text.alpha = 0
        text.tag = 402
        self.view.addSubview(text)
        
        text.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32).isActive = true
        text.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -32).isActive = true
        
        timerText = text
        
        
        let boxText = UITextView()
        boxText.translatesAutoresizingMaskIntoConstraints = false
        boxText.isScrollEnabled = false
        boxText.isSelectable = false
        boxText.font = .preferredFont(forTextStyle: .headline)
        boxText.text = textMessage
        boxText.isEditable = false
        boxText.backgroundColor = UIColor(red: 255/256, green: 238/256, blue: 183/256, alpha: 1.0)
        //----- Dialogue text color
        boxText.textColor = UIColor(red: 152/256, green: 74/256, blue: 74/256, alpha: 1.0)
        boxText.tag = 403
        boxText.layer.cornerRadius = 70
        boxText.contentInset = .init(top: 32, left: 32, bottom: 32, right: 32)
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(boxClick))
        boxText.addGestureRecognizer(tap)
        boxText.isUserInteractionEnabled = true
        
        view.addSubview(boxText)
        boxText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32).isActive = true
        boxText.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -32).isActive = true
        boxText.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -32).isActive = true
        boxText.heightAnchor.constraint(equalToConstant: 224).isActive = true
        //--------- Pon Name Dialogue Title
        let nameTag = UIImageView.init(image: UIImage.init(named: "PON name.png"))
        nameTag.translatesAutoresizingMaskIntoConstraints = false
        nameTag.contentMode = .scaleAspectFit
        nameTag.tag = 404
        view.addSubview(nameTag)
        
        nameTag.leadingAnchor.constraint(equalTo: boxText.leadingAnchor, constant: 16).isActive = true
        nameTag.bottomAnchor.constraint(equalTo: boxText.topAnchor, constant: 16).isActive = true
        nameTag.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        //--------- Continue Text
        let continueText = UILabel.init()
        continueText.translatesAutoresizingMaskIntoConstraints = false
        continueText.contentMode = .scaleAspectFit
        continueText.tag = 405
        continueText.text = "Next ▶︎"
        continueText.textColor = UIColor(red: 152/256, green: 74/256, blue: 74/256, alpha: 1.0)
        continueText.font = .preferredFont(forTextStyle: .headline)
        continueText.alpha = 1
        view.addSubview(continueText)
        
        continueText.trailingAnchor.constraint(equalTo: boxText.trailingAnchor, constant: -48).isActive = true
        continueText.bottomAnchor.constraint(equalTo: boxText.bottomAnchor, constant: -12).isActive = true
    }
    
    var player: AVAudioPlayer?
    @objc func clickButton() {
        playSound(fileName: "pop-button")
    }
    
    func playSound(fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else { return }
            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @objc func boxClick() {
        print("Click")
        
        let button = self.view.viewWithTag(401)!
        let label = self.view.viewWithTag(402)!
        let textBox = self.view.viewWithTag(403)!
        let image = self.view.viewWithTag(404)!
        let nextButton = self.view.viewWithTag(405)!
        
        UIView.animate(withDuration: 1.25, delay: 0, options: .curveLinear, animations: {
            button.alpha = 1
            label.alpha = 1
            textBox.alpha = 0
            image.alpha = 0
            nextButton.alpha = 0
        }) { (done) in
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                textBox.isHidden = true
                image.isHidden = true
                nextButton.isHidden = true
                
                self.runTImer()
                self.animation(leftEyeConstX: self.xConst, leftEyeConstY: self.yConst)
            }
        }
    }
    
    
    func animation(leftEyeConstX: NSLayoutConstraint, leftEyeConstY: NSLayoutConstraint) {
        if breakAnimation { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            if self.breakAnimation { return }
            UIView.animate(withDuration: 1.25, delay: 0, options: .curveEaseInOut, animations: {
                leftEyeConstY.constant = 156
                self.view.layoutIfNeeded()
                print("Done1")
            }) { (isSuccess) in
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if self.breakAnimation { return }
                    UIView.animate(withDuration: 2.5, delay: 0, options: .curveEaseInOut, animations: {
                        leftEyeConstY.constant = 196
                        self.view.layoutIfNeeded()
                        print("Done2")
                    }) { (isSuccess) in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            if self.breakAnimation { return }
                            UIView.animate(withDuration: 1.25, delay: 0, options: .curveEaseInOut, animations: {
                                leftEyeConstY.constant = 174
                                self.view.layoutIfNeeded()
                                print("Done3")
                            }) { (isSuccess) in
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    if self.breakAnimation { return }
                                    self.animation(leftEyeConstX: leftEyeConstX, leftEyeConstY: leftEyeConstY)
                                }
                                print("Done - \(isSuccess)")
                            }
                        }
                        print("Done - \(isSuccess)")
                    }
                }
            }
        }
    }
    
    func runTImer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        time += 1
        timerText.text = timeString(time: time)
        if breakAnimation { timer.invalidate() }
    }
    
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format: "%02i:%02i", minutes, seconds)
        
    }
    
    
    @objc func nextPage() {
        breakAnimation = true
        timer.invalidate()
        self.navigationController?.popViewController(animated: true)
    }
}




// Present the view controller in the Live View window
let view = Menu()
let navigation = UINavigationController(rootViewController: view)

navigation.setNavigationBarHidden(true, animated: false)
navigation.preferredContentSize = CGSize(width: 720, height: 720)

PlaygroundPage.current.liveView = navigation
PlaygroundPage.current.needsIndefiniteExecution = true

/* =====  Credits  =====
Designed and Developed by:
Brian Supatra

Images and icons by:
Brian Supatra

Photo by:
Vadim Sherbakov @ unsplash.com

Sound:
Pop 2 by greenvwbeetle @freesound.org
*/

