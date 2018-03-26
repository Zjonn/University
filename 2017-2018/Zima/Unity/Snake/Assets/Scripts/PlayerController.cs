using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlayerController : MonoBehaviour
{
    public GameObject tailPrefab;
    public GameObject foodPrefab;
    public GameObject place;
    public Text text;
    public Text gameOver;
    public float x, y;

    public int beginSize;

    public float speed = 1;
    public float rotationSpeed = 50;

    private float rotation;
    private float minDis = 1.1f;

    private int points = 0;

    public List<Transform> Tail;
    private GameObject food;

    // Use this for initialization
    void Start()
    {

        for (int i = 0; i < beginSize - 1; i++) AddTail();
        food = Instantiate(foodPrefab, new Vector3(10f, 0.5f, 10f), new Quaternion(0, 0, 0, 0)) as GameObject;
    }

    private void addPoints(int p)
    {
        points += p;
        text.text = "Points: " + points;
    }

    private void Move()
    {
        Tail[0].Translate(Tail[0].forward * speed * Time.smoothDeltaTime, Space.World);
        if (rotation != 0)
            Tail[0].Rotate(Vector3.up * rotation * Time.smoothDeltaTime * rotationSpeed);

        Transform curr, prev;
        Vector3 newPos;
        for (int i = 1; i < Tail.Count; i++)
        {
            if (i != 1 && Tail.Count>5 && Vector3.Distance(Tail[0].position, Tail[i].position) < 0.5f)
            {
                Kolizja(Tail[i].GetComponent<Collider>());
                break;
            }

            curr = Tail[i];
            prev = Tail[i - 1];

            newPos = prev.position;
            newPos.y = Tail[0].position.y;

            float dis = Time.deltaTime * Vector3.Distance(prev.position, curr.position) / minDis * speed;
            if (dis > 0.5f) dis = 0.5f;
            //if (dis < 0.5f) return;

            curr.position = Vector3.Slerp(curr.position, newPos, dis);
            curr.rotation = Quaternion.Slerp(curr.rotation, prev.rotation, dis);
        }
    }

    void AddTail()
    {
        Transform newPart = (Instantiate(tailPrefab, Tail[Tail.Count - 1].position, Tail[Tail.Count - 1].rotation) as GameObject).transform;
        newPart.SetParent(transform);
        Tail.Add(newPart);
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKey(KeyCode.Space)) AddTail();
        else if (Input.GetKey(KeyCode.Escape)) Application.Quit();


        rotation = Input.GetAxis("Horizontal");

    }

    private void FixedUpdate()
    {
        Move();
    }


    public void Kolizja(Collider other)
    {
        if (other.CompareTag("Pick Up"))
        {
            food.transform.position = new Vector3(Random.Range(-x, x), 0.5f, Random.Range(-y, y));
            AddTail();
            addPoints(1);
        }
        else if (other.gameObject.Equals(Tail[1].gameObject))
        { }
        else if(other.gameObject.layer == 8)
        {
            int indx = Tail.IndexOf(other.transform);
            
            
            for (int i = indx; i < Tail.Count; i++)
            {
                if (i <= indx + 1)
                {
                    Tail[i].gameObject.SetActive(false);
                    DestroyObject(Tail[i].gameObject);
                }
                Tail[i].gameObject.layer = 9 ;
            }
            int mp = Tail.Count - indx;
            Tail.RemoveRange(indx, mp);
            
            addPoints(-mp);
        }
        else
        {
            Time.timeScale = 0;
            gameOver.text = "Game Over";
            print("Kolizja");
        }
    }
}



