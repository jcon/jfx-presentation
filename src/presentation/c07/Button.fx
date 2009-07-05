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
import javafx.scene.layout.Stack;

/**
 * Simple button that resizes itself based on its text.  This button
 * provides feedback indicating when its clicked.  For more flexible
 * UI contorls, look over the javafx.scene.control package. 
 */
public class Button extends CustomNode {
    // We'll pad the text, so let's use a constant
    def PADDING: Number = 4;

    var backgroundHighlightColor = Color.rgb(0x87, 0xAA, 0xD4);
    var backgroundColor = Color.rgb(0x50, 0x82, 0xC1);

    // Programs can update this value
    public var text: String;

    // the node for the text, updates whenever
    // text does
    var textNode = Text {
        content: bind text
        font: Font {
            name: "Georgia"
            size: 16
        }
        textOrigin: TextOrigin.TOP
    }

    // Track the height and width of the text node
    var width: Number;
    var height: Number;
    // A trigger that is executed whenever textNode.boundsInLocal changes
    // this allows us to update the height and width whenever the text
    // changes.
    var textBounds = bind textNode.boundsInLocal on replace {
        width = textBounds.width + PADDING * 2;
        height = textBounds.height + PADDING * 4;
    }

    override var onMousePressed = function(e: MouseEvent) {
        pressed = true;
    }

    /**
     * The button attributes change according to the value of pressed to indicate
     */
    public override function create(): Node {
        return Group {
            content: [
                Stack {
                    content: [
                        Rectangle {
                            width: bind width
                            height: bind height
                            arcWidth: bind width / 20
                            arcHeight: bind width / 20
                            // the bound functions below automatically return
                            // new values whenever 'pressed' changes
                            fill: bind calculateBackground()
                            effect: bind calculateShadow()
                        },
                        textNode
                    ]
                }
            ]
            translateX: bind if (pressed) PADDING else 0
            translateY: bind if (pressed) PADDING else 0
        };
    }

    // updates the background depending on whether the button
    // is pressed
    bound function calculateBackground() {
        if (pressed) {
            backgroundColor
        } else {
            LinearGradient {
                startX: 0.0, startY: 0.0, endX: 0.0, endY: 1.0
                proportional: true
                stops: [
                    Stop { offset: 0.0 color: backgroundHighlightColor },
                    Stop { offset: 0.15 color: backgroundColor },
                ]
            }
        }
    }

    // if the button is not pressed, draw a shadow to make it
    // appear as if it is above the form.
    bound function calculateShadow() {
        if (pressed) {
            null
        } else {
            DropShadow {
                color: Color.GRAY
                offsetX: PADDING
                offsetY: PADDING
            }
        }
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

