package presentation.c02;

import java.lang.Math;
import javafx.scene.paint.Color;
import javafx.scene.Scene;
import javafx.scene.shape.ClosePath;
import javafx.scene.shape.CubicCurve;
import javafx.scene.shape.LineTo;
import javafx.scene.shape.MoveTo;
import javafx.scene.shape.Path;
import javafx.stage.Stage;
import javafx.scene.layout.VBox;

def SIXTY_DEGREES: Number = 60 * 2 * Math.PI / 360;

Stage {
    title : "Fancy Shapes"
    scene: Scene {
        width: 400
        height: 600
        content: VBox {
            translateX: 60
            spacing: 60
            content: [
                CubicCurve {
                       startX:   0,     startY:  100
                    controlX1:  50,  controlY1:   0
                    controlX2:  150,  controlY2: 200
                         endX: 200,       endY:  100
                },
                // Iso Triangle
                Path {
                    fill: Color.DARKBLUE
                    elements: [
                        MoveTo {
                            x: 0
                            y: 0
                        },
                        LineTo {
                            x: 200
                            y: 0
                        },
                        LineTo {
                            x: bind Math.cos(SIXTY_DEGREES) * 200
                            y: bind Math.sin(SIXTY_DEGREES) * 200
                        },
                        ClosePath { }
                    ]
                }
            ]
        }
    }
}
