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

var translateRect = Rectangle {
    x: 140   // start to left
    y: 50    // and slightly lower
    width: 200
    height: 200
    fill: Color.DARKGOLDENROD
    transforms: [
        Translate {
            x: -40
            y: 200
        } 
    ]
};



Stage {
    title: "Translate"
    scene: Scene {
        width: 400
        height: 600
        content: [
            rect,
            translateRect
        ]
    }
}