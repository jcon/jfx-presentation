package presentation.effect;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.*;
import javafx.scene.effect.*;
import javafx.scene.effect.light.*;
import javafx.scene.paint.Color;

var text = Text {
    content: "JavaSIG"
    font: Font.font("Garmond", FontWeight.BOLD, 90)
    x: 10,
    y: 30,
    textOrigin: TextOrigin.TOP
    stroke: Color.BLACK
    strokeWidth: 3
    fill: Color.DEEPSKYBLUE
}


var shadowText = Text {
    content: "JavaSIG"
    font: Font.font("Garmond", FontWeight.BOLD, 90)
    x: 10,
    y: 200,
    textOrigin: TextOrigin.TOP
    stroke: Color.BLACK
    strokeWidth: 3
    fill: Color.DEEPSKYBLUE    
    effect: Lighting {
        light: DistantLight { azimuth: -135 }
        surfaceScale: 5
    }
 
}

Stage {
    title: "Drop Shadow"
    width: 400
    height: 600
    scene: Scene {
        content: [
            text,
            shadowText
        ]
    }
}