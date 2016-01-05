//
//  QuesoVC.swift
//  PizzaPersonalizada
//
//  Created by Mariona on 5/1/16.
//  Copyright © 2016 Mariona. All rights reserved.
//

import UIKit

class QuesoVC: UIViewController {

    var tamañoSeleccionado : String = ""
    var masaSeleccionada : String = ""
    var quesoSeleccionado : String = ""
    let quesos : [String] = ["mozzarela", "cheddar", "parmesano", "sin queso"]
    
    @IBOutlet weak var quesoMozzarela: UISwitch!
    @IBOutlet weak var quesoCheddar: UISwitch!
    @IBOutlet weak var quesoParmesano: UISwitch!
    @IBOutlet weak var sinQueso: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print (masaSeleccionada)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func activarSwitch(sender: UISwitch)
    {
        //solo un swhitch activada al mismo tiempo
        desactivaSwitchs()
        if self.quesoSeleccionado == quesos[0] && sender == quesoMozzarela || self.quesoSeleccionado == quesos[1] && sender == quesoCheddar || self.quesoSeleccionado == quesos[2] && sender == quesoParmesano || self.quesoSeleccionado == quesos[3] && sender == sinQueso
        {
            self.quesoSeleccionado = ""
        }
        else
        {
            switch sender
            {
            case quesoMozzarela:
                self.quesoSeleccionado = quesos[0]
                break
            case quesoCheddar:
                self.quesoSeleccionado = quesos[1]
                break
            case quesoParmesano:
                self.quesoSeleccionado = quesos[2]
                break
            case sinQueso:
                self.quesoSeleccionado = quesos[3]
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
        self.quesoMozzarela.setOn(false, animated: true)
        self.quesoCheddar.setOn(false, animated: true)
        self.quesoParmesano.setOn(false, animated: true)
        self.sinQueso.setOn(false, animated: true)
    }
    func switchOn(sender: UISwitch)
    {
        sender.setOn(true, animated: true)
    }
    
    
    @IBAction func comprovarSeleccion()
    {
        if self.quesoSeleccionado == ""
        {
            print ("no se ha especificado tamaño!!")
            let alerta : UIAlertController = UIAlertController(title: "Alerta", message: "no has especificado el queso deseado", preferredStyle: UIAlertControllerStyle.Alert)
            alerta.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alerta, animated: true, completion: nil)
        }
        else
        {
            self.performSegueWithIdentifier("aIngredientes", sender: self)
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let siguienteVista = segue.destinationViewController as! IngredientesVC
        siguienteVista.tamañoSeleccionado = self.tamañoSeleccionado
        siguienteVista.masaSeleccionada = self.masaSeleccionada
        siguienteVista.quesoSeleccionado = self.quesoSeleccionado
    }

}
