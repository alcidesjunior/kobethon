import PlaygroundSupport
import SpriteKit 

public class DrumSet: SKScene{
    public var hihatE = SKSpriteNode(imageNamed: "ride")
    public var snareE = SKSpriteNode(imageNamed: "snare")
    public var kickE  = SKSpriteNode(imageNamed: "kick")
    public var board = SKSpriteNode(imageNamed: "board") //white background
    public var msgPressToPlay = SKSpriteNode(imageNamed: "msgPressPlay")
    public var background = SKSpriteNode(imageNamed: "background") //background screen
    public var bend = SKSpriteNode(imageNamed: "bend")
    
    public var letterC = SKLabelNode(text: "A")
    public var letterB = SKLabelNode(text: "D")
    public var letterM = SKLabelNode(text: "K")

    
    //BOTOES
    public var playButton = SKSpriteNode(imageNamed: "playButton")
    public var playButtonWasTouched = false
    
    public var lesson1Button = SKSpriteNode(imageNamed: "lesson1ButtonActive")
    public var lesson1ButtonWasTouched = false
    
    public var lesson2Button = SKSpriteNode(imageNamed: "lesson2Button")
    public var lesson2ButtonWasTouched = false
    
    public var lessonSelected: SKAction?
    public var flagLessonSelected: Int!
    public var currentAnimation: SKAction?
    
    //necessário para apresentar o count down
    public var fakeTexture = SKSpriteNode()
    
   public override func didMove(to view: SKView) {
        //IMAGEM DE FUNDO
        anchorPoint = CGPoint(x: 0, y: 0)
        background.position = CGPoint(x: 0, y: 0)
        background.anchorPoint = CGPoint(x: 0, y:0)
        addChild(background)
        board.anchorPoint = CGPoint(x: 0, y: 0)
        board.position = CGPoint(x: (view.frame.width/2) - 260, y: (view.frame.height/2)+32)
        board.size = CGSize(width: 526, height: 249)
    
        msgPressToPlay.size = CGSize(width: 526, height: 249)
        msgPressToPlay.anchorPoint = CGPoint(x: 0, y: 0)
    
        fakeTexture.anchorPoint = CGPoint(x: 0, y: 0)
        fakeTexture.size = CGSize(width: 526, height: 249)
    
        //POSICIONANDO BOTOES
        //BOTAO PLAY
        playButton.anchorPoint = CGPoint(x:0, y:0)
        playButton.position = CGPoint(x: 173, y: (view.frame.height/2)+90)
        playButton.size = CGSize(width: 71, height: 57)
        playButton.name = "playButton"
        playButton.isUserInteractionEnabled = false
        //BOTAO NIVEL1
        lesson1Button.anchorPoint = CGPoint(x:0, y:0)
        lesson1Button.position = CGPoint(x: 173, y: (view.frame.height/2)+220)
        lesson1Button.size = CGSize(width: 71, height: 20)
        lesson1Button.name = "lesson1Button"

        //BOTAO NIVEL2
        lesson2Button.anchorPoint = CGPoint(x:0, y:0)
        lesson2Button.position = CGPoint(x: 173, y: (view.frame.height/2)+170)
        lesson2Button.size = CGSize(width: 71, height: 20)
        lesson2Button.name = "lesson2Button"
    
        //POR PADRAO O USUARIO JA ESTARÁ NO LEVEL 1
        self.flagLessonSelected = 1
        //ADICIONANDO COISAS NA TELA
        addChild(board)
        board.addChild(msgPressToPlay)
        //BOTOES
        addChild(playButton)
        addChild(lesson1Button)
        addChild(lesson2Button)
    
    }
    
    //RETORNA APENAS A SEQUENCIA DE IMAGENS PARA O lesson1
    public func lesson1(){
        self.fakeTexture.removeAllActions()
        let anim = SKAction.animate(with: [SKTexture(imageNamed: "1"),SKTexture(imageNamed: "2"),SKTexture(imageNamed: "3"),SKTexture(imageNamed: "4")], timePerFrame: 1.2)
        self.fakeTexture.size = CGSize(width: 526, height: 249)
        self.fakeTexture.run(SKAction.repeatForever( SKAction.sequence([anim]) ) )
        
        self.fakeTexture.run(SKAction.sequence([anim]))
    }
    
    //RETORNA APENAS A SEQUENCIA DE IMAGENS PARA O lesson2
    public func lesson2(){
        self.fakeTexture.removeAllActions()
        let anim2 = SKAction.animate(with: [SKTexture(imageNamed: "5"),SKTexture(imageNamed: "6"),SKTexture(imageNamed: "7"),SKTexture(imageNamed: "8"),SKTexture(imageNamed: "9"),SKTexture(imageNamed: "10"),SKTexture(imageNamed: "11"),SKTexture(imageNamed: "12")], timePerFrame: 0.8)
        self.fakeTexture.size = CGSize(width: 526, height: 249)
        self.fakeTexture.run(SKAction.repeatForever(SKAction.sequence([anim2])))
    }
    
    //RESPONSAVEL POR SABER O TOQUE
    public override func mouseDown(with event: NSEvent) {
        //PEGANDO A LOCALIZACAO DO EVENTO
        let location = event.location(in: self)
        let spriteTouched = nodes(at: location)
        
        
        //CHECANDO SE O BOTAO PLAY FOI TOCADO
        if spriteTouched.first?.name == "playButton"{
            
            self.playButtonWasTouched = !playButtonWasTouched
            if(self.playButtonWasTouched){
                self.playButton.texture = SKTexture(imageNamed: "stop")

                self.board.removeChildren(in: [self.msgPressToPlay])

                self.board.addChild(self.fakeTexture)
                //ANIMACAO COUNTDOWN
                let animationCountDown = SKAction.animate(with: [SKTexture(imageNamed: "four"),SKTexture(imageNamed: "three"),SKTexture(imageNamed: "two"),SKTexture(imageNamed: "one"),SKTexture(imageNamed: "go")], timePerFrame: 0.9)
                //ANIMACAO RITIMO

                self.fakeTexture.run(SKAction.sequence([animationCountDown])) {
                    if self.flagLessonSelected == 1 {
                        self.lesson1()
                    }else if self.flagLessonSelected == 2 {
                        self.lesson2()
                    }
                }
                
            }else{
                self.board.removeChildren(in: [self.fakeTexture])
                self.msgPressToPlay.size = CGSize(width: 526, height: 249)
                self.fakeTexture.size = CGSize(width: 526, height: 249)
                self.board.addChild(self.msgPressToPlay)
                self.playButton.texture = SKTexture(imageNamed: "playButton")
                
            }
        }
        //BOTAO lesson1 PRESSIONADO
        if spriteTouched.first?.name == "lesson1Button"{
            self.flagLessonSelected = 1
            self.lesson1Button.texture = SKTexture(imageNamed: "lesson1ButtonActive")
            self.lesson2Button.texture = SKTexture(imageNamed: "lesson2Button")
            if self.playButtonWasTouched{
                self.playButtonWasTouched = !self.playButtonWasTouched
                self.fakeTexture.size = CGSize(width: 526, height: 249)
                self.playButton.texture = SKTexture(imageNamed: "playButton")
                self.board.removeChildren(in: [self.fakeTexture])
                self.board.addChild(self.msgPressToPlay)
            }
        }
        //BOTAO lesson2 PRESSIONADO
        if spriteTouched.first?.name == "lesson2Button"{
            self.flagLessonSelected = 2
            self.lesson2Button.texture = SKTexture(imageNamed: "lesson2ButtonActive")
            self.lesson1Button.texture = SKTexture(imageNamed: "lesson1Button")
            if self.playButtonWasTouched{
                self.playButtonWasTouched = !self.playButtonWasTouched
                self.fakeTexture.size = CGSize(width: 526, height: 249)
                self.playButton.texture = SKTexture(imageNamed: "playButton")
                self.board.removeChildren(in: [self.fakeTexture])
                self.board.addChild(self.msgPressToPlay)
                
            }
        }
    }
    
    //RESPONSAVEL POR SABER SOBRE O EVENTO DAS TECLAS
    public override func keyDown(with event: NSEvent) {
        if event.keyCode == 0 {
            beatSnare()
        }else if event.keyCode == 2{
            beatKick()
        }else if event.keyCode == 40{
            beatHihat()
        }
    }
   

    public func mountDrumKit(){
        hihatE.anchorPoint = CGPoint(x:0,y:0)
        hihatE.position = CGPoint(x: 390, y: -8)
        hihatE.zPosition = 2
        
        snareE.anchorPoint = CGPoint(x:0,y:0)
        snareE.position = CGPoint(x: 150, y: -30)
        
        kickE.anchorPoint = CGPoint(x:0,y:0)
        kickE.position = CGPoint(x: 290, y: -40)
        kickE.zPosition = 1
        
        bend.anchorPoint = CGPoint(x:0,y:0)
        bend.position = CGPoint(x: 328, y: -2)
        bend.zPosition = 2
        
        
        hihatE.size = CGSize(width: 308, height: 308)
        snareE.size = CGSize(width: 308, height: 308)
        kickE.size = CGSize(width: 308, height: 308)
        
        self.letterC.fontSize = 30
        self.letterC.fontColor = NSColor.black
        self.letterC.fontName = "AvenirNext-Bold"
        
        self.letterC.position = CGPoint(x: 310, y: 5)
        
        self.letterB.fontSize = 30
        self.letterB.fontColor = NSColor.black
        self.letterB.fontName = "AvenirNext-Bold"
        
        self.letterB.position = CGPoint(x: 440, y: 5)
        
        self.letterM.fontSize = 30
        self.letterM.fontColor = NSColor.black
        self.letterM.fontName = "AvenirNext-Bold"
        
        self.letterM.position = CGPoint(x: 546, y: 5)
        
        self.addChild(hihatE)
        self.addChild(snareE)
        self.addChild(kickE)
        self.addChild(bend)
        self.addChild(letterC)
        self.addChild(letterB)
        self.addChild(letterM)
    }
    public func beatSnare(){
        let animationSnare = SKAction.animate(with: [SKTexture(imageNamed: "snareBeated"),SKTexture(imageNamed: "snare")], timePerFrame: 0.1)
        self.snareE.run(animationSnare)
        let sound = SKAction.playSoundFileNamed("snare.mp3", waitForCompletion: false)
        run(sound)
    }
    public func beatKick(){
        let animationKick = SKAction.animate(with: [SKTexture(imageNamed: "kickBeated"),SKTexture(imageNamed: "kick")], timePerFrame: 0.1)
        self.kickE.run(animationKick)
        let sound = SKAction.playSoundFileNamed("kik.mp3", waitForCompletion: false)
        run(sound)
    }
    public func beatHihat(){
        let animationHihat = SKAction.animate(with: [SKTexture(imageNamed: "rideBeated"),SKTexture(imageNamed: "ride")], timePerFrame: 0.1)
        self.hihatE.run(animationHihat)
        
        self.hihatE.run(animationHihat)
        let sound = SKAction.playSoundFileNamed("ride.mp3", waitForCompletion: false)
        run(sound)
    }
   
    
}
