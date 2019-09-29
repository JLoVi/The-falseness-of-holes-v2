using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;

public class Portal : MonoBehaviour
{

    public Material[] materials;

    public Transform device;

    bool wasInFront;
    bool inOtherWorld;

    bool reverseMat;

    // Start is called before the first frame update
    void Start()
    {
      //  SetMaterials();
//        device = GameObject.Find("Main Camera").transform;

        foreach (var mat in materials)
        {
            Debug.Log(mat.GetInt("_StencilTest"));


        }
    }

    void SetMaterials()
    {
        //var stencilTest = fullRender ? CompareFunction.NotEqual : CompareFunction.Equal;

        foreach (var mat in materials)
        {
            //mat.SetInt("_StencilTest", (int)stencilTest);
            if(mat.GetInt("_StencilTest")== 6)
            {
                mat.SetInt("_StencilTest", 3);
            }
            else if (mat.GetInt("_StencilTest") == 3)
            {
                mat.SetInt("_StencilTest", 6);
            }

            Debug.Log(mat.GetInt("_StencilTest"));

        }

    }

   /* bool GetIsInFront()
    {
        Vector3 pos = transform.InverseTransformPoint(device.position);
        return pos.z >= 0 ? true : false;
    }*/

    void OnTriggerExit(Collider other)
    {
        Debug.Log("exit");
        if (other.transform != device)
            return;
        SetMaterials();

        //wasInFront = GetIsInFront();
    }

  /*  void OnTriggerStay(Collider other)
    {
       

        if (other.transform != device)
            return;
       
     //   bool isInFront = GetIsInFront();
        

        if ((isInFront && !wasInFront) || (wasInFront && !isInFront))
        {
            Debug.Log("Stay");
            inOtherWorld = !inOtherWorld;
            SetMaterials();
            
        }
        wasInFront = isInFront;
    }*/

    void OnDestroy()
    {
        //SetMaterials();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
