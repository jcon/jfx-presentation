package presentation.c06;

import javafx.stage.Stage;
import javafx.scene.image.*;
import javafx.scene.Scene;
import javafx.scene.shape.*;
import javafx.animation.*;
import javafx.scene.transform.Scale;
import javafx.scene.paint.Color;

// X, Y coordinates of Rectangle
// Need a way to continually update these to perform an animation
var xPosition = 0;
var yPosition = 0;
var rect = Rectangle {
    x: bind xPosition
    y: bind yPosition
    height: 50
    width: 50
    fill: Color.DARKGREEN
};

// Enter the Timeline: a declaritive mechanism for controlling arbitrary
// values at any time
var timeline = Timeline {
    repeatCount: 1
    // Key frames are specify how values should be interpolated
    keyFrames: [
        // This keyframe resets our x, y coordinates to 0 at time = 0 seconds
        KeyFrame {
            time: 0s
            values: [
                xPosition => 0,
                yPosition => 0
            ]
        },
        // This keyframe increments from 0 to 325 for the X value and
        // 0 to 525 for y in even increments
        KeyFrame {
            time: 1s
            values: [
                xPosition => 325 tween Interpolator.EASEIN,
                yPosition => 525 tween Interpolator.EASEIN
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