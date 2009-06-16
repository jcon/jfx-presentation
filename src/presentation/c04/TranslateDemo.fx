package presentation.c04;

import javafx.scene.transform.*;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;

var effectSwitch: EffectSwitch = EffectSwitch {
    node: Rectangle {
        x: 100   
        y: 10  
        width: 200
        height: 200
        fill: Color.DARKGOLDENROD
        transforms: [
            Translate {
                x: bind if (effectSwitch.effectOn) -40 else 0
                y: bind if (effectSwitch.effectOn) 50 else 0
            }
        ]
    }
};



Stage {
    title: "Translate"
    scene: Scene {
        width: 400
        height: 600
        content: effectSwitch
    }
}