//
//  MasaVC.swift
//  PizzaPersonalizada
//
//  Created by Mariona on 5/1/16.
//  Copyright © 2016 Mariona. All rights reserved.
//

import UIKit

class MasaVC: UIViewController {

    var tamañoSeleccionado : String = ""
    var masaSeleccionada : String = ""
    let masas : [String] = ["delgada", "crujiente", "gruesa"]
    
    @IBOutlet weak var masaDelgada: UISwitch!
    @IBOutlet weak var masaCrujiente: UISwitch!
    @IBOutlet weak var masaGruesa: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(tamañoSeleccionado)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func activarSwitch(sender: UISwitch)
    {
        //solo un swhitch activada al mismo tiempo
        desactivaSwitchs()
        if self.masaSeleccionada == masas[0] && sender == masaDelgada || self.masaSeleccionada == masas[1] && sender == masaCrujiente || self.masaSeleccionada == masas[2] && sender == masaGruesa
        {
            self.masaSeleccionada = ""
        }
        else
        {
            switch sender
            {
            case masaDelgada:
                self.masaSeleccionada = masas[0]
                break
            case masaCrujiente:
                self.masaSeleccionada = masas[1]
                break
            case masaGruesa:
                self.masaSeleccionada = masas[2]
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
        self.masaDelgada.setOn(false, animated: true)
        self.masaCrujiente.setOn(false, animated: true)
        self.masaGruesa.setOn(false, animated: true)
    }
    func switchOn(sender: UISwitch)
    {
        sender.setOn(true, animated: true)
    }
    
    
    @IBAction func comprovarSeleccion()
    {
        if self.masaSeleccionada == ""
        {
            print ("no se ha especificado tamaño!!")
            let alerta : UIAlertController = UIAlertController(title: "Alerta", message: "no has especificado la masa deseada", preferredStyle: UIAlertControllerStyle.Alert)
            alerta.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alerta, animated: true, completion: nil)
        }
        else
        {
            self.performSegueWithIdentifier("aQueso", sender: self)
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let siguienteVista = segue.destinationViewController as! QuesoVC
        siguienteVista.tamañoSeleccionado = self.tamañoSeleccionado
        siguienteVista.masaSeleccionada = self.masaSeleccionada
    }

}
