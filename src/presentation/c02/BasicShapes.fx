package presentation.c02;

import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.Scene;
import javafx.scene.shape.Arc;
import javafx.scene.shape.ArcType;
import javafx.scene.shape.Circle;
import javafx.scene.shape.Rectangle;
import javafx.stage.Stage;

Stage {
    title : "BasicShapes"
    scene: Scene {
        width: 400
        height: 600
        content: [
            Circle {
                centerX: 200
                centerY: 100
                radius: 100
                fill: null
                stroke: Color.DARKGREEN
            },
            Arc {

                centerX: 200, centerY: 325
                radiusX: 100,  radiusY: 100
                startAngle: 45,  length: 270
                type: ArcType.ROUND
                fill: Color.YELLOW
            },
            Rectangle {
                x: 100
                y: 450
                height: 100
                width: 200
                stroke: Color.NAVY
                fill: LinearGradient {
                    startX: 0.0, startY: 0.0, endX: 0.0, endY: 1.0
                    proportional: true
                    stops: [
                        Stop { offset: 0.0 color: Color.rgb(0x87, 0xAA, 0xD4) },
                        Stop { offset: 0.15 color: Color.rgb(0x50, 0x82, 0xC1) },
                    ]
                }
            }
        ]
    }
}
