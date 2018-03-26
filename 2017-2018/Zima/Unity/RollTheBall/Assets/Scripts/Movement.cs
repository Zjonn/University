using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Movement : MonoBehaviour
{
    public Rigidbody rb;
    public Text CountText;
    public Text winText;
    private float speed = 8;
    private int points;

    void Start()
    {
        rb = GetComponent<Rigidbody>();
        points = 0;
        setPoints();
        winText.text = "";
    }

    void FixedUpdate()
    {
        float vx = Input.GetAxis("Vertical") * speed;
        float vy = -Input.GetAxis("Horizontal") * speed;

        if (Input.GetKeyDown(KeyCode.Escape))
            Application.Quit();

        rb.AddForce(new Vector3(vx, 0, vy));
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Pick Up"))
        {
            other.gameObject.SetActive(false);
            points++;
            setPoints(points);
        }
    }

    private void setPoints(int val = 0)
    {
        CountText.text = "Punkty: " + val;
        if (points >= 9)
        {
            winText.text = "You win";
        }
    }
}
