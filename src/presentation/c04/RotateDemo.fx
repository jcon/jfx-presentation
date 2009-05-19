package presentation.c04;

import javafx.scene.paint.Color;
import javafx.scene.Scene;
import javafx.scene.shape.Rectangle;
import javafx.scene.transform.*;
import javafx.stage.Stage;

var effectSwitch: EffectSwitch = EffectSwitch {
    node: Rectangle {
        x: 100
        y: 0
        width: 200
        height: 200
        fill: Color.DARKOLIVEGREEN
        transforms: [
            Rotate {
                angle: bind if (effectSwitch.effectOn) 45 else 0
                pivotX: 150
                pivotY: 350
            }
        ]
    }
};

Stage {
    title: "Rotate"
    scene: Scene {
        width: 400
        height: 600
        content: effectSwitch
    }
}