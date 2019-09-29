using UnityEngine;
using UnityEditor;
namespace IllusionLoop
{
    [CustomEditor(typeof(CanalGateController))]
    public class CanalGateController_UI : Editor
    {
        enum Tool {TEST = 0,INFO = 1,EDIT = 2 }
        Tool currentTool = Tool.INFO;
        CanalGateController controller;

        public override void OnInspectorGUI()
        {
            controller = (CanalGateController)target;
            currentTool = (Tool)GUILayout.Toolbar((int)currentTool, new string[] { "Test", "Info", "Edit" });

            switch (currentTool)
            {
                case Tool.EDIT:
                    DrawEdit();
                    break;
                case Tool.INFO:
                    DrawInfo();
                    break;
                case Tool.TEST:
                    DrawTest();
                    break;
            }
        }

        void DrawInfo()
        {
            EditorGUILayout.HelpBox("You can hover over most UI elements to get more information.\n\n" +
                "Script:\n" +
                "You can access the script by:\n" +
                " [this object].GetComponent<IllusionLoop.CanalGateController>();\n" +
                "Or use SendMessage.\n\n" +
                "Methods:\n" +
                " [Gate].Open()\n" +
                "  opens the gate entirely\n" +
                " [Gate].Close()\n" +
                "  closes the gate entirely\n" +
                " [Gate].Snap(float normalizedPosition)\n" +
                "  snaps immediately to normalizedPosition(0 - 1)\n" +
                " [Gate].Stop()\n" +
                "  stops the gate at it's current position\n\n" +
                "Variables:\n" +
                " [Gate].TargetPosition\n" +
                " set this variable to move the gate to the desired position(0 = closed 1 = open)\n" +
                "\n" +
                "for more information visit:",MessageType.Info);
            if (GUILayout.Button("www.illusionloop.com/docs"))
            {
                Application.OpenURL("http://www.illusionloop.com/docs");
            }
        }
        void DrawTest()
        {
            
            if (Application.isPlaying)
            {
                Repaint();
                EditorGUILayout.BeginHorizontal();
                float tPos = controller.TargetPosition;
                tPos = 1f - GUILayout.VerticalSlider(1f - tPos, 0, 1, GUI.skin.verticalScrollbar, GUI.skin.verticalScrollbarThumb, GUILayout.Height(150), GUILayout.ExpandWidth(false));

                EditorGUILayout.BeginVertical(GUILayout.Height(150));
                GUILayout.Label("open", GUILayout.Width(40));
                GUILayout.FlexibleSpace();
                GUILayout.Label("gate\npos:", GUILayout.Width(40));
                tPos = EditorGUILayout.FloatField(tPos, GUILayout.Width(40));
                GUILayout.FlexibleSpace();
                GUILayout.Label("closed", GUILayout.Width(40));
                EditorGUILayout.EndVertical();

                if (tPos != controller.TargetPosition)
                {
                    controller.TargetPosition = tPos;
                }

                GUILayout.VerticalSlider(1f-controller.GetRelativeGatePosition(), 0, 1, GUI.skin.verticalScrollbar, GUI.skin.verticalScrollbarThumb, GUILayout.Height(150), GUILayout.ExpandWidth(false));
                GUILayout.BeginVertical();
                if (GUILayout.Button("Open"))
                {
                    controller.Open();
                }
                if (GUILayout.Button("Close"))
                {
                    controller.Close();
                }
                if (GUILayout.Button("Stop"))
                {
                    controller.Stop();
                }
                GUILayout.EndVertical();
                GUILayout.EndHorizontal();
            }
            else
            {
                EditorGUILayout.HelpBox("Here you can test the gate without any additional code.\n" +
                    "Testing UI will appear at runtime", MessageType.Info);
            }
        }
        void DrawEdit()
        {
            DrawDefaultInspector();
            controller.TargetPosition = EditorGUILayout.Slider("TargetPosition",controller.TargetPosition, 0, 1);
        }
    }
}
