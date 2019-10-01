using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PortalManager : MonoBehaviour
{
    public List<GameObject> scenePrefabs;
    public List<GameObject> portalPrefabs;
    public List<GameObject> portalWindows;

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
                portalPrefabs[1].SetActive(true);
                break;

            case 3:
                portalPrefabs[0].SetActive(false);
                scenePrefabs[0].SetActive(false);

                scenePrefabs[2].SetActive(true);
                portalPrefabs[2].SetActive(true);

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

    public void ActivatePortal()
    {
        switch (activeSceneNumber)
        {
            case 2:
                portalWindows[1].GetComponent<Collider>().isTrigger = true;
                break;

            case 3:
                portalWindows[1].GetComponent<Collider>().isTrigger = true;
                break;

            case 4:
                portalWindows[1].GetComponent<Collider>().isTrigger = true;
                break;

            case 5:
                portalWindows[1].GetComponent<Collider>().isTrigger = true;
                break;

            case 6:
                portalWindows[1].GetComponent<Collider>().isTrigger = true;
                break;

            default:
                print("Incorrect intelligence level.");
                break;
        }
    }
}
