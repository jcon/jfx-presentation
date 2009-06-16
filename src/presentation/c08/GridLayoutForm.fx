package presentation.c08;

import java.awt.GridLayout;
import javafx.ext.swing.SwingButton;
import javafx.ext.swing.SwingComponent;
import javafx.ext.swing.SwingHorizontalAlignment;
import javafx.ext.swing.SwingLabel;
import javafx.ext.swing.SwingTextField;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javax.swing.JPanel;

var name: SwingTextField = SwingTextField {
    columns: 10
};

var age: SwingTextField = SwingTextField {
    columns: 4
};

/**
 * We can use Swing components inside JavaFX. We just need to wrap them
 * inside a swing component.
 *
 * Most common swing components are already wrapped!
 */
class SwingGridPanel extends SwingComponent{

    var panel: JPanel;

    // Instead of calling panel.add() for each component, we can
    // add components declaritively
    public var contents: SwingComponent[]
        on replace {
            for (c in contents) {
                panel.add(c.getJComponent());
            }
        };

    // Every SwingComponent has to return its underlying JComponent
    public override function createJComponent(){
        panel = new JPanel(new GridLayout(0, 2));
        return panel;
    }

}

Stage {
    title : "SimpleForm"
    scene: Scene {
        width: 400
        height: 600
        content: [
            SwingGridPanel {
                translateX: 100
                translateY: 100
                // Declaritvely add to JPanel without explicitly calling
                // add.  Shows visually in code where they're laid out
                contents: [
                    // row 1
                    SwingLabel {
                        labelFor: name
                        text: "Name:"
                        horizontalAlignment: SwingHorizontalAlignment.RIGHT
                    },
                    name,
                    // row 2
                    SwingLabel {
                        labelFor: age
                        text: "Age:"
                        horizontalAlignment: SwingHorizontalAlignment.RIGHT
                    },
                    age,
                    // row 3
                    SwingButton {
                        text: "Save"
                        action: function() {
                            println("saving first={name.text} age={age.text}")
                        }
                    },
                    SwingButton {
                        text: "Cancel"
                        action: function() {
                            println("cancel changes first={name.text} age={age.text}")
                        }
                    }
                ]
            }
        ]
    }
}
