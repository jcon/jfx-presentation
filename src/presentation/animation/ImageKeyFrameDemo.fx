package presentation.animation;

import javafx.stage.Stage;
import javafx.scene.image.*;
import javafx.scene.Scene;
import javafx.animation.*;
import javafx.scene.transform.Scale;


var frame = 0;
var duke = ImageView {
    image: bind Image {
        url: "{__DIR__}/duke/T{frame}.gif";
    }
    transforms: [
/*        Scale { x: 2, y: 2 } */
    ]
};

var timeline = Timeline {
    repeatCount: Timeline.INDEFINITE
    autoReverse: true
    keyFrames: [
        KeyFrame {
            time: 3s
            values: [
                frame => 16 tween Interpolator.LINEAR
            ]
        }
/*
        // More succinct declaration of KeyFrame
        at(3s) {
            frame => 16 tween Interpolator.LINEAR;
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