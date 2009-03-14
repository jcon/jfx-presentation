package presentation.effect;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.*;
import javafx.scene.effect.DropShadow;
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
    effect:
        DropShadow {
            offsetX: 5
            offsetY: 15
            color: Color.GRAY
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