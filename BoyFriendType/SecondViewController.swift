

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate{
    //名字
    @IBOutlet weak var NameTextField: UITextField!
    //年紀
    @IBOutlet weak var AgeSlider: UISlider!
    @IBOutlet weak var AgeLabel: UILabel!
    //約會地點
    @IBOutlet weak var DatePlace: UISegmentedControl!
    //結婚或不婚
    @IBOutlet weak var Marry: UISwitch!
    @IBOutlet weak var Celibate: UISwitch!
    //顯示出名字內容圖片
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var WordLabel: UILabel!
    @IBOutlet weak var ShowImage: UIImageView!
    @IBOutlet weak var SpeakLabel: UILabel!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
     //執行textfield delegate
        NameTextField.delegate = self
        
    }
 
    //限制字數
    func textField (_ _textfield:UITextField,shouldChangeCharactersIn range:NSRange,replacementString string:String) ->Bool
    {
        guard let text = NameTextField.text else {return true}
       let count = text.count  + string.count - range.length
        //如果字數超過10就不行
        if count > 10
        {
            return false
        }
    
        return true
        
    }
    //按retrun鍵返回
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
      NameTextField.resignFirstResponder()
        
       return true
    }
  
  //年紀
    @IBAction func AgeActionSlider(_ sender: UISlider, forEvent event: UIEvent)
    {
        let AgeNumber = Int(AgeSlider.value)
        AgeLabel.text = String(AgeNumber) + "歲"
    }
    //結婚或不婚 (兩個Switch拉一個Action)
    @IBAction func MarryOrNot(_ sender: UISwitch)
    {
        //由sender 判斷哪一個開關,此範例判斷以結婚開關為主
        if sender == Marry
        {   //如果結婚開關是打開
            if Marry.isOn
            {  //不婚開關就關起來
                Celibate.setOn(false, animated: true)
            }
          //或是
        }else
        {   //如果不婚開關打開
            if Celibate.isOn
            { //結婚開關就關起來
                Marry.setOn(false, animated: true)
            }
        }
     
    
    }
    
    //找到他
    @IBAction func FindHimAction(_ sender: UIButton)
    {   //顯示出名字
        let name = NameTextField.text
        NameLabel.text = name
        
        //資料不齊全 會出現資料填寫不完全
        if NameTextField.text == "" 
        {
            SpeakLabel.text = "資料填寫不完整"
            ShowImage.image = UIImage(named: "")
        }//狗系男友
        else if AgeSlider.value  >= 20,AgeSlider.value <= 40, DatePlace.selectedSegmentIndex == 1 ,Marry.isOn
        {
            SpeakLabel.text =
                "對世界來說，你也許是某人。而對我來說，你就是全世界 "
            ShowImage.image = UIImage(named: "dog")
            
        }//狼系男友
        else if AgeSlider.value  >= 18 ,AgeSlider.value <= 30, DatePlace.selectedSegmentIndex == 1 ,Celibate.isOn
        {
            SpeakLabel.text =
                "我只怕你。因為我只怕我老婆"
            ShowImage.image = UIImage(named: "wolf")
        }//兔系男友
        else if AgeSlider.value  >= 28 ,AgeSlider.value <= 40 ,DatePlace.selectedSegmentIndex == 0 , Marry.isOn
        {
            SpeakLabel.text = "不要抱怨了，抱抱我吧"
            ShowImage.image = UIImage(named: "rabbit")
        }//貓系男友
        else if AgeSlider.value  >= 18 ,AgeSlider.value <= 30 ,DatePlace.selectedSegmentIndex == 0 , Celibate.isOn
        {
            SpeakLabel.text = "你真的是一個很麻煩的人， 但我偏偏愛找麻煩。"
            ShowImage.image = UIImage(named: "cat")
        }//單身狗
        else
        {
            SpeakLabel.text = "抱歉，對的狗還在路上"
            ShowImage.image = UIImage(named: "wait")
        }
        
    }
    //重新找
    @IBAction func AgainAction(_ sender: UIButton)
    {
        //姓名清空
        NameTextField.text = ""
        NameLabel.text = ""
        //年紀重新
        AgeSlider.value = 0
        AgeLabel.text = ""
        //約會變為0
        DatePlace.selectedSegmentIndex = 0
        //結婚不婚都關掉
        Marry.setOn(false, animated: true)
        Celibate.setOn(false, animated: true)
        //顯現文字圖片清空
        SpeakLabel.text = ""
        ShowImage.image = UIImage(named: "")
        
    }
    
    
    
}
