package presentation.c04;

import javafx.ext.swing.SwingButton;
import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.layout.VBox;
import javafx.scene.Node;

public class EffectSwitch extends CustomNode {
    public-init var node: Node;
    public-read var effectOn: Boolean = false on replace {
        if (effectOn) {
            text = "Hide Effect"
        } else {
            text = "Show Effect"
        }
    }

    var text;

    public override function create(): Node {
        return Group {
            content: [
                VBox {
                    spacing: 100
                    content: [
                        node,
                        SwingButton {
                            text: bind text
                            action: function() {
                                effectOn = not effectOn;
                            }
                        }
                    ]
                }
            ]
        };
    }
}
