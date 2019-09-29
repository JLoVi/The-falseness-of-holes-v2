using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;

public class Portal : MonoBehaviour
{

    public Material[] materials;

    public Transform device;

    public int sceneToActivate;

    public delegate void activateAction();
    public static event activateAction OnActivated;


    void Start()
    {
      
        foreach (var mat in materials)
        {
            Debug.Log(mat.GetInt("_StencilTest"));
        }
    }

    void SetMaterials()
    {

        foreach (var mat in materials)
        {
           
            if(mat.GetInt("_StencilTest")== 6)
            {
                mat.SetInt("_StencilTest", 3);
            }
            else if (mat.GetInt("_StencilTest") == 3)
            {
                mat.SetInt("_StencilTest", 6);
            }

           // Debug.Log(mat.GetInt("_StencilTest"));

        }

    }
  
    void OnTriggerExit(Collider other)
    {
        Debug.Log("exit");
        if (other.transform != device)
            return;
        SetMaterials();

        if(gameObject.GetComponent<BoxCollider>() != null) gameObject.GetComponent<BoxCollider>().enabled = false;

        PortalManager.activeSceneNumber = sceneToActivate;
        if (OnActivated != null)
            OnActivated();

    }

  

    
}
