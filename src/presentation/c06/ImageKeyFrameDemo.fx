
package presentation.c06;

import javafx.animation.*;
import javafx.scene.image.*;
import javafx.scene.Scene;
import javafx.scene.transform.Scale;
import javafx.stage.Stage;

/**
 * A simple animation loop where Duke tumbles.
 *
 * @author 	we don't need James Gosling for this one! :)
 */
// Track frames from 0 to 16
var frame = 0;
// ImageView is a node that can display images
var duke = ImageView {
    image: bind Image {
        // Variables enclosed in { } insides strings are interpretted
        url: "{__DIR__}duke/T{frame}.gif";
    }
    // We'll make this image view bigger for the demo
//    transforms: [
//        Scale { x: 2, y: 2 }
//    ]
};

var timeline = Timeline {
    // Keep going until the program quits
    repeatCount: Timeline.INDEFINITE
    autoReverse: true
    keyFrames: [
        // More succinct declaration of KeyFrame
        at(3s) {
            frame => 16 tween Interpolator.LINEAR;
        }
/*
        KeyFrame {
            time: 3s
            values: [
                frame => 16 tween Interpolator.LINEAR
            ]
        }
        */
    ]
};

timeline.playFromStart();

Stage {
    title: "Duke"
    scene: Scene {
        width: 400
        height: 600
        content: [
            duke
        ]
    }
}