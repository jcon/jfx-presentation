package presentation.c07;

import java.lang.Object;
import javafx.scene.CustomNode;
import javafx.scene.effect.DropShadow;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.Scene;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.scene.text.TextOrigin;
import javafx.stage.Stage;
import javafx.scene.input.MouseEvent;

public class Button extends CustomNode {
    def PADDING: Number = 4;
    
    public var text: String;

    var textNode = Text {
        content: bind text
        font: Font {
            name: "Georgia"
            size: 16
        }
        textOrigin: TextOrigin.TOP
        translateX: PADDING
        translateY: 2* PADDING
    }

    // Track the height and width of the text node
    var width: Number;
    var height: Number;
    var textBounds = bind textNode.boundsInLocal on replace {
        width = textBounds.width + PADDING * 2;
        height = textBounds.height + PADDING * 4;
    }

    override var onMousePressed = function(e: MouseEvent) {
        pressed = true;
    }

    public override function create(): Node {
        return Group {
            content: [
                Rectangle {
                    width: bind width
                    height: bind height
                    arcWidth: bind width / 20
                    arcHeight: bind width / 20
                    fill: bind if (pressed) {
                        Color.rgb(0x50, 0x82, 0xC1)
                    } else {
                        LinearGradient {
                            startX: 0.0, startY: 0.0, endX: 0.0, endY: 1.0
                            proportional: true
                            stops: [
                                Stop { offset: 0.0 color: Color.rgb(0x87, 0xAA, 0xD4) },
                                Stop { offset: 0.15 color: Color.rgb(0x50, 0x82, 0xC1) },
                            ]
                        }
                    }
                    effect: bind if (pressed) {
                        null
                    } else {
                        DropShadow {
                            color: Color.GRAY
                            offsetX: PADDING
                            offsetY: PADDING
                        }
                    }
                },
                textNode
            ]
            translateX: bind if (pressed) PADDING else 0
            translateY: bind if (pressed) PADDING else 0
        };
    }
}

public function run() {
    Stage {
        title : "Button"
        scene: Scene {
            width: 400
            height: 600
            content: [
                Button {
                    text: "Click Me!"
                    translateX: 100
                    translateY: 100
                }
            ]
        }
    }

}

