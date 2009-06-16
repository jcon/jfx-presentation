package presentation.c06;

import javafx.stage.Stage;
import javafx.scene.image.*;
import javafx.scene.Scene;
import javafx.scene.shape.*;
import javafx.animation.*;
import javafx.animation.transition.*;
import javafx.scene.transform.Scale;
import javafx.scene.paint.Color;

// X,Y coordinates of our rectangle (same as before)
var xPosition = 0;
var yPosition = 0;
var rect = Rectangle {
    x: bind xPosition
    y: bind yPosition
    height: 50
    width: 50
    fill: Color.DARKGREEN
};

// Translate Transition combines the Translate transform with an animation
// timeline.  This is an equivalent animation to the KeyFrameDemo.
var translate = TranslateTransition {
    repeatCount: Timeline.INDEFINITE
    duration: 3s
    node: rect
    byX: 325
    byY: 525
};

translate.playFromStart();

Stage {
    title: "Translate Transition"
    scene: Scene {
        width: 400
        height: 600
        content: [
            rect
        ]
    }
}