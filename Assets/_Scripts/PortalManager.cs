using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PortalManager : MonoBehaviour
{
    public List<GameObject> scenePrefabs;
    public List<GameObject> portalPrefabs;

    public static int activeSceneNumber;

    void OnEnable()
    {
        Portal.OnActivated += ActivateScene;
    }


    void OnDisable()
    {
        Portal.OnActivated -= ActivateScene;
    }

    public void ActivateScene()
    {
        switch (activeSceneNumber)
        {
            case 2:
                scenePrefabs[1].SetActive(true);
                break;
            case 3:
                print("Hello and good day!");
                break;
            case 4:
                print("Whadya want?");
                break;
            case 5:
                print("Grog SMASH!");
                break;
            case 6:
                print("Ulg, glib, Pblblblblb");
                break;
            default:
                print("Incorrect intelligence level.");
                break;
        }
    }
}
