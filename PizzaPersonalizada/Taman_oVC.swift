//
//  TamañoVC.swift
//  PizzaPersonalizada
//
//  Created by Mariona on 5/1/16.
//  Copyright © 2016 Mariona. All rights reserved.
//

import UIKit

class Taman_oVC: UIViewController {

    var tamañoSeleccionado : String = ""
    let tamaños : [String] = ["chica", "mediana", "grande"]
    
    @IBOutlet weak var tamañoChica: UISwitch!
    @IBOutlet weak var tamañoMediana: UISwitch!
    @IBOutlet weak var tamañoGrande: UISwitch!
    
      override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func activarSwitch(sender: UISwitch)
    {
        //solo un swhitch activada al mismo tiempo
        desactivaSwitchs()
        if self.tamañoSeleccionado == tamaños[0] && sender == tamañoChica || self.tamañoSeleccionado == tamaños[1] && sender == tamañoMediana || self.tamañoSeleccionado == tamaños[2] && sender == tamañoGrande
        {
            self.tamañoSeleccionado = ""
        }
        else
        {
            switch sender
            {
            case tamañoChica:
                self.tamañoSeleccionado = tamaños[0]
                break
            case tamañoMediana:
                self.tamañoSeleccionado = tamaños[1]
                break
            case tamañoGrande:
                self.tamañoSeleccionado = tamaños[2]
                break
            default:
                print("switch no controlado!")
                break
            }
            
            switchOn(sender)
        }
    }
    
    func desactivaSwitchs ()
    {
        self.tamañoChica.setOn(false, animated: true)
        self.tamañoMediana.setOn(false, animated: true)
        self.tamañoGrande.setOn(false, animated: true)
    }
    func switchOn(sender: UISwitch)
    {
        sender.setOn(true, animated: true)
    }
    
    
    @IBAction func comprovarSeleccion()
    {
        if self.tamañoSeleccionado == ""
        {
            print ("no se ha especificado tamaño!!")
            let alerta : UIAlertController = UIAlertController(title: "Alerta", message: "no has especificado el tamaño deseado", preferredStyle: UIAlertControllerStyle.Alert)
            alerta.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alerta, animated: true, completion: nil)
        }
        else
        {
            self.performSegueWithIdentifier("aMasa", sender: self)
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let siguienteVista = segue.destinationViewController as! MasaVC
        siguienteVista.tamañoSeleccionado = self.tamañoSeleccionado
    }
}
