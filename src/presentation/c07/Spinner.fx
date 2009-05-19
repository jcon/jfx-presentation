package presentation.c07;

import java.lang.Object;
import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.Scene;
import javafx.scene.shape.Rectangle;
import javafx.scene.transform.Rotate;
import javafx.stage.Stage;
import javafx.scene.layout.VBox;
import javafx.ext.swing.SwingButton;

class Spinner extends CustomNode {
    public var hiddenColor: Color = Color.WHITE;
    public var fill: Color;
    public var radius: Number;    
    var offset = 10;

    def rectangleWidth = .2 * radius;
    def rectangleHeight = .6 * radius;
    
    var timeline = Timeline {
        repeatCount: Timeline.INDEFINITE
        keyFrames: [
            at (1s) {
                offset => 0 tween Interpolator.LINEAR
            }
        ]
    };

    public function play() {
        timeline.play();
    }

    public function playOrPause() {
        if (timeline.paused) {
            timeline.play();
        } else {
            timeline.pause();
        }
    }

    public override function create(): Node {
        return Group {
            content: [
                for (i in [0..10]) {
                    Rectangle {
                        x: radius - rectangleWidth / 2
                        y: 0
                        height: rectangleHeight
                        width: rectangleWidth
                        fill: bind hiddenColor.ofTheWay(fill, ((i + offset) mod 10)/10.0) as Color
                        arcHeight: .25 * rectangleWidth
                        arcWidth: .5 * rectangleWidth
                        transforms: [
                            Rotate {
                                angle: i * 36
                                pivotX: radius
                                pivotY: radius
                            }
                        ]
                    }
                }
            ]
        };
    }
}


public function run() {
    var s = Spinner {
        fill: Color.GRAY
        radius: 100
    };
    s.play();
    Stage {
        title : "Spinner"
        scene: Scene {
            width: 400
            height: 400
            content: [
                VBox {
                    content: [
                        s,
                        SwingButton {
                            text: "Pause"
                            action: function() {
                                s.playOrPause();
                            }
                        }
                    ]
                }
            ]
        }
    }
}

