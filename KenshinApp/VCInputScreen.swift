//
//  VCInputScreen.swift
//  KenshinApp
//
//  Created by MaiInagaki on 2018/09/11.
//  Copyright © 2018年 GaGdev14. All rights reserved.
//

/*
     検針値入力画面：ResultReportの入力用タブ設定用クラス
 
    やることリスト
    ・音声入力後、削除ボタンを押しても落ちないようにする
    ・今月の検針値がマイナスの場合はエラーを表示する（できればブルブル）
 
*/
 
import UIKit
import Speech

class VCInputScreen: UIViewController, UITextFieldDelegate, SFSpeechRecognizerDelegate {
    
    // 画面表示プロパティ
    @IBOutlet weak var lastMonthValue: UILabel!
    @IBOutlet weak var usedThisMonth: UILabel!
    @IBOutlet weak var usedLastYear: UILabel!
    @IBOutlet weak var thisMonthValue: UITextField!
    @IBOutlet weak var warningStatement: UILabel!
    
    var lastMonthValueStr: String = ""
    var usedThisMonthStr: String = ""
    var usedLastYearStr: String = ""
    var thisMonthValueStr: String = ""
    
    // 音声入力機能プロパティ
    // localeのidentifierに言語を指定。日本語はja-JP,英語はen-US
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ja-JP"))!
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    //録音の開始、停止ボタン
    var recordButton : UIButton!
    
    // 次へボタン
    @IBOutlet weak var nextPage: Button_Custom!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 次へボタンの色定義
        nextPage.backgroundColor = UIColor(hex: "E5523B")
        nextPage.setTitleColor(UIColor(hex: "FFFFFF"), for: .normal)
        nextPage.layer.borderColor = UIColor(hex: "E5523B").cgColor
        nextPage.layer.borderWidth = 2
        nextPage.layer.cornerRadius = 26
        
        
        //入力ボックスのデフォルト値（うっすら表示する文字）
        thisMonthValue.placeholder = "入力してください"
        
        //数字のキーボードを表示する
        self.thisMonthValue.keyboardType = UIKeyboardType.numberPad
        
        //入力値をリアルタイムで取得
        thisMonthValue.delegate = self
        
        //のちのちここで代入
        lastMonthValueStr = "1256"
        lastMonthValue.text = lastMonthValueStr
        usedLastYearStr = "34"
        usedLastYear.text = usedLastYearStr
        
        // 音声入力
        print("１：初期状態")
        //audioEngine.stop() // audioは最初停止状態
        
        //録音を開始するボタンの設定
        recordButton = UIButton()
        recordButton.frame = CGRect(x: 40, y: 100, width: 170, height: 40)
        recordButton.backgroundColor = UIColor.lightGray
        recordButton.addTarget(self, action: #selector(recordButtonTapped(sender:)), for:.touchUpInside)
        recordButton.setTitle("🎤音声入力開始", for: [])
        recordButton.isEnabled = false
        self.view.addSubview(recordButton)
        //デリゲートの設定
        speechRecognizer.delegate = self
        //ユーザーに音声認識の許可を求める
        SFSpeechRecognizer.requestAuthorization { authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                case .authorized:
                    //ユーザが音声認識の許可を出した時
                    self.recordButton.isEnabled = true
                case .denied:
                    //ユーザが音声認識を拒否した時
                    self.recordButton.isEnabled = false
                    self.recordButton.setTitle("User denied access to speech recognition", for: .disabled)
                case .restricted:
                    //端末が音声認識に対応していない場合
                    self.recordButton.isEnabled = false
                    self.recordButton.setTitle("Speech recognition restricted on this device", for: .disabled)
                case .notDetermined:
                    //ユーザが音声認識をまだ認証していない時
                    self.recordButton.isEnabled = false
                    self.recordButton.setTitle("Speech recognition not yet authorized", for: .disabled)
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // テキストフィールドに入力された文字(textプロパティが保持)を定数textに代入
        var text: String = thisMonthValue.text!
        
        text = text + string
        // 今月の使用量を計算する
        calculateUsage(text: Int(text)!)
       
        
        /*
        // 定数textをラベルのtextプロパティ(ラベルに表示される文字)に代入
        //なぜか最後の一文字が入らないので、stingで取得する入力文字を繫げることで解決
        usedThisMonth.text = text! + string
 */
                return true
    }
    
    public func calculateUsage(text: Int){
        
        // var thisMonth: Int = 0
        var thisMonth: Int = text
        var lastMonth: Int = 0
        
        //thisMonth = Int(text)! //音声入力結果を削除すると、ここでエラーになる
        lastMonth = Int(lastMonthValueStr)!
        print(thisMonth)
        
        let gasUsage: Int = thisMonth - lastMonth
        print(gasUsage)
        
        usedThisMonth.text = String(gasUsage)
        
    }
    
    // 録音ボタンが押されたら呼ばれる
    @objc func recordButtonTapped(sender: UIButton) {
        if audioEngine.isRunning {
            audioEngine.stop() // この後に、音声入力結果を成形して、resultのところに動く
            recognitionRequest?.endAudio()
            recordButton.isEnabled = false
            recordButton.setTitle("終了", for: .disabled)
            //録音が停止した！
            print("録音停止")
        } else {
            // 録音を開始する
            // massageResult.text = ""
            print("２：録音開始")
            try! startRecording()
            recordButton.setTitle("音声入力終了", for: [])
        }
    }
    
    //録音を開始する
    private func startRecording() throws {
        print("３：録音中")
        // 以前のタスクが実行中の場合はキャンセル
        if let recognitionTask = recognitionTask {
            recognitionTask.cancel()
            self.recognitionTask = nil
        }
        let audioSession = AVAudioSession.sharedInstance()
        
        // 録音用のカテゴリをセット
        try audioSession.setCategory(AVAudioSessionCategoryRecord)
        try audioSession.setMode(AVAudioSessionModeMeasurement)
        try audioSession.setActive(true, with: .notifyOthersOnDeactivation)
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let inputNode: AVAudioInputNode = audioEngine.inputNode else { fatalError("Audio engine has no input node") }
        guard let recognitionRequest = recognitionRequest else { fatalError("Unable to created a SFSpeechAudioBufferRecognitionRequest object") }
        
        // オーディオ録音が完了する前に結果が返されるようにリクエストを設定する
        recognitionRequest.shouldReportPartialResults = false
        
        // 認識タスクは、音声認識セッションを表す
        // 取り消すことができるようにタスクへの参照を保持
        recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest) { result, error in
            var isFinal = false
            var voiceMessage: String = ""
            if let result = result {
                //音声認識の区切りの良いところで実行される。
                print("４：録音完了")
                print(result.bestTranscription.formattedString)
                voiceMessage = result.bestTranscription.formattedString
                self.thisMonthValue.text = voiceMessage
                
                // 入力文字をInt型に変換する
                self.changeIntVoiceMassage(voiceMessage: result.bestTranscription.formattedString)
                
                isFinal = result.isFinal
            }
            if error != nil || isFinal {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                self.recognitionRequest = nil
                self.recognitionTask = nil
                self.recordButton.isEnabled = true
                self.recordButton.setTitle("音声入力開始", for: [])
            }
        }
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self.recognitionRequest?.append(buffer)
        }
        audioEngine.prepare()
        try audioEngine.start()
    }
    
    // MARK: SFSpeechRecognizerDelegate
    //speechRecognizerが使用可能かどうかでボタンのisEnabledを変更する
    public func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            recordButton.isEnabled = true
            recordButton.setTitle("音声入力開始", for: [])
        } else {
            recordButton.isEnabled = false
            recordButton.setTitle("Recognition not available", for: .disabled)
        }
    }
    
    public func changeIntVoiceMassage(voiceMessage: String){
        
        
        let array = voiceMessage.components(separatedBy: ",")
        let afterVoiceMessage = array.joined()
        print(afterVoiceMessage)
        
        //入力値チェック
        let checkInt: Bool = afterVoiceMessage.isOnly(structuredBy: "0123456789")
        if(checkInt == true) {
            let text: Int = Int(afterVoiceMessage)!
            print(text)
            self.warningStatement.text = ""
            //この後、計算メソッドを呼べばいけるはず
            calculateUsage(text: text)
        } else{
            print("数字を入力してください")
            thisMonthValue.text = ""
            warningStatement.text = "※音声入力再挑戦求む！"
        }
    }
}

extension String {
    public func isOnly(structuredBy chars: String) -> Bool {
        let characterSet = NSMutableCharacterSet()
        characterSet.addCharacters(in: chars)
        //return self.stringByTrimmingCharactersInSet(characterSet).length <= 0
        return self.trimmingCharacters(in: characterSet as CharacterSet).count <= 0
    }
}

