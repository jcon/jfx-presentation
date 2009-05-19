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

public class Triangle extends CustomNode {

    public-init var fill: Paint = Color.BLACK;
    public-init var stroke: Paint = Color.BLACK;

    def SIXTY_DEGREES: Number = 60 * 2 * Math.PI / 360;

    public var side: Number;

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

public function run() {
    Stage {
    title : "Triangle"
    scene: Scene {
        width: 400
        height: 600
        content: [
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




