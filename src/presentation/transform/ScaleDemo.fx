package presentation.transform;

import javafx.scene.transform.*;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;

var rect = Rectangle {
    x: 50
    y: 10
    width: 200
    height: 200
    fill: Color.BURLYWOOD
};

var scaleRect = Rectangle {
    x: 50
    y: 250    // start lower than original
    width: 200
    height: 200
    fill: Color.BURLYWOOD
    transforms: [
        Scale {
            pivotX: 50
            pivotY: 150
            x: 1.25
            y: 1.25
        }
    ]
};


Stage {
    title: "Scale"
    scene: Scene {
        width: 400
        height: 600
        content: [
            rect,
            scaleRect
        ]
    }
}