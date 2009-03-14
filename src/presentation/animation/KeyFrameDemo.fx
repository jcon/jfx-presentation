package presentation.animation;

import javafx.stage.Stage;
import javafx.scene.image.*;
import javafx.scene.Scene;
import javafx.scene.shape.*;
import javafx.animation.*;
import javafx.scene.transform.Scale;
import javafx.scene.paint.Color;


var xPosition = 0;
var yPosition = 0;
var rect = Rectangle {
    x: bind xPosition
    y: bind yPosition
    height: 50
    width: 50
    fill: Color.DARKGREEN
};


var timeline = Timeline {
    repeatCount: 1
    keyFrames: [
        KeyFrame {
            time: 0s
            values: [
                xPosition => 0
                yPosition => 0
            ]
        },
        KeyFrame {
            time: 3s
            values: [
                xPosition => 325 tween Interpolator.LINEAR
                yPosition => 525 tween Interpolator.LINEAR
            ]
        }
/*
        // More succinct definition of key frames
        at(0s) {
            xPosition => 0;
            yPosition => 0;
        },
        at(3s) {
            xPosition => 325 tween Interpolator.LINEAR;
            yPosition => 525 tween Interpolator.LINEAR;
        }
*/
    ]
};


timeline.playFromStart();


Stage {
    title: "Key Frame"
    scene: Scene {
        width: 400
        height: 600
        content: [
            rect
        ]
    }
}