package presentation.c04;

import javafx.scene.transform.*;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;

var effectSwitch: EffectSwitch = EffectSwitch {
    node: Rectangle {
        x: 50
        y: 10
        width: 200
        height: 200
        fill: Color.BURLYWOOD
        transforms: [
            Scale {
                pivotX: 50
                pivotY: 150
                x: bind if (effectSwitch.effectOn) 1.25 else 1
                y: bind if (effectSwitch.effectOn) 1.25 else 1
            }
        ]
    }
};


Stage {
    title: "Scale"
    scene: Scene {
        width: 400
        height: 600
        content: effectSwitch
    }
}