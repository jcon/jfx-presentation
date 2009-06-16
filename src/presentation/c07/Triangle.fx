package presentation.c07;

import java.lang.Math;
import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.paint.Paint;
import javafx.scene.shape.ClosePath;
import javafx.scene.shape.LineTo;
import javafx.scene.shape.MoveTo;
import javafx.scene.shape.Path;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.input.MouseEvent;

/**
 * All custom node classes extend CustomNode and must implement
 * the create(): Node function.
 *
 * Same Triangle as a path element from FancyShapes demo, now in a re-usable
 * component.
 */
public class Triangle extends CustomNode {

    public-init var fill: Paint = Color.BLACK;
    public-init var stroke: Paint = Color.BLACK;

    // Math.cos/sin needs angle in radians
    def SIXTY_DEGREES: Number = 60 * 2 * Math.PI / 360;

    public var side: Number;

    override var onMouseClicked = function( e: MouseEvent ):Void {
        println("mouse clicked")
    }


    public override function create(): Node {
        return Path {
            fill: fill
            stroke: stroke
            elements: [
                MoveTo {
                    x: 0
                    y: 0
                },
                LineTo {
                    x: bind side
                    y: 0
                },
                LineTo {
                    x: bind Math.cos(SIXTY_DEGREES) * side
                    y: bind Math.sin(SIXTY_DEGREES) * side
                },
                ClosePath { }
            ]
        };
    }
}

// Whenever we have a public class and we want to include a stage,
// we need to wrap it in a special function
public function run() {
    Stage {
        title : "Triangle"
        scene: Scene {
            width: 400
            height: 600
            content: [
                // Looks just like any other built-in shape now!
                Triangle {
                    side: 200
                    fill: Color.DARKBLUE
                    translateX: 100
                    translateY: 200
                }
            ]
        }
    }

}




