package presentation.transform;

import javafx.scene.transform.*;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;

var rect = Rectangle {
    x: 100
    y: 10
    width: 200
    height: 200
    fill: Color.DARKOLIVEGREEN
};

var rotateRect = Rectangle {
    x: 100
    y: 250        // start lower than original
    width: 200
    height: 200
    fill: Color.DARKOLIVEGREEN
    transforms: [
        Rotate {
            angle: 45
            pivotX: 150
            pivotY: 350
        }
    ]
};



Stage {
    title: "Rotate"
    scene: Scene {
        width: 400
        height: 600
        content: [
            rect,
            rotateRect
        ]
    }
}