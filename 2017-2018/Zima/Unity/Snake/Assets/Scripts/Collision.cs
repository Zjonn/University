using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Collision : MonoBehaviour
{

    private void OnTriggerEnter(Collider other)
    {
        transform.parent.GetComponent<PlayerController>().Kolizja(other);
    }

    private void OnCollisionEnter(UnityEngine.Collision collision)
    {
        print("Kolizja 2");
        if (collision.gameObject.layer == 9)
            transform.parent.GetComponent<PlayerController>().Kolizja(collision.collider);
    }
}
