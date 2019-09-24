using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Rendering;

public class InterdimensionalTransport : MonoBehaviour
{

    public Material[] materials;

    public GameObject player;
    // Start is called before the first frame update
    void Start()
    {
        foreach (var mat in materials)
        {
            mat.SetInt("_StencilTest", (int)CompareFunction.NotEqual);
        }
    }

    private void OnTriggerStay(Collider other)
    {
        if (other != player.GetComponent<BoxCollider>()) return;

        if (transform.position.z > other.transform.position.z)
        {
            foreach(var mat in materials)
            {
                mat.SetInt("_StencilTest", (int)CompareFunction.Equal);
            }
        }
        else
        {
            foreach(var mat in materials)
            {
                mat.SetInt("_StencilTest", (int)CompareFunction.NotEqual);
            }
        }
    }

    void OnDestroy()
    {
        foreach (var mat in materials)
        {
            mat.SetInt("_StencilTest", (int)CompareFunction.NotEqual);
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
