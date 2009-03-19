/*
 * HelloJavaSIG.fx
 *
 * Created on Mar 17, 2009, 11:50:55 AM
 */

package presentation.firstscript;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;

/**
 * @author jconnell
 */

Stage {
    title: "Hello JavaSIG", width: 400, height: 600
    scene: Scene {
        content: [
            Rectangle {
                x: 15, y: 450
                width: 250, height: 100
                stroke: Color.BLACK
                fill: Color.LIGHTGREEN
            },
            Text {
                font : Font {
                    size : 36
                }
                x: 20, y: 505
                content: "Hello JavaSIG"
                fill: Color.WHITE
                strokeWidth: 2
                stroke: Color.DARKGREEN
            }
            ]
    }
}