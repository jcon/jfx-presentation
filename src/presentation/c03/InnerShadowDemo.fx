package presentation.c03;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.*;
import javafx.scene.effect.DropShadow;
import javafx.scene.paint.Color;
import javafx.scene.effect.InnerShadow;

var shadowText = Text {
    content: "CT Java"
    font: Font.font("Impact", FontWeight.BOLD, 90)
    x: 10,
    y: 200,
    textOrigin: TextOrigin.TOP
    stroke: Color.BLACK
    strokeWidth: 3
    fill: Color.CHOCOLATE
    effect:
        InnerShadow {
            offsetX: 6
            offsetY: 5
        }   
}

Stage {
    title: "Drop Shadow"
    width: 400
    height: 600
    scene: Scene {
        content: [
            shadowText
        ]
    }
}