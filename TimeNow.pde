int blank, startDist, endDist;
int secondLength, minuteLength, hourLength;

void setup()
{
    blank = 120;
    startDist = 275;
    endDist = 280;
    
    secondLength = 230;
    minuteLength = 150;
    hourLength = 80;
    
    size(768, 768);
    background(0);
    ellipse(width / 2, height / 2, width - blank, height - blank);
    
    textFont(createFont("Times New Roman",64));
    textAlign(CENTER, CENTER);
    
    for (int i = 0; i < 12; i++)
    {
        float angle = 3.1415 * (i - 2) * 30 / 180;
        
        fill(0);
        text(i + 1, endDist * cos(angle) + (width / 2), endDist * sin(angle) + (height / 2));
    }
    
    frameRate(1);
    updateTime();
}

void draw()
{
    noStroke();
    fill(255);
    ellipse(width / 2, height / 2, secondLength * 2 + 4, secondLength * 2 + 4);
    
    updateTime();    
}

void updateTime()
{
    float secondAngle = (second() * 6 - 90) * 3.1415 / 180;
    float minuteAngle = ((minute() * 6 - 90) * 3.1415 / 180) + (secondAngle / 60);
    float hourAngle = ((hour() * 30 - 82.5) * 3.1415 / 180) + (minuteAngle / 12);
    
    stroke(0);
    strokeWeight(2);
    line(secondLength * cos(secondAngle) + (width / 2), secondLength * sin(secondAngle) + (height / 2), width / 2, height / 2);
    strokeWeight(4);
    line(minuteLength * cos(minuteAngle) + (width / 2), minuteLength * sin(minuteAngle) + (height / 2), width / 2, height / 2);
    strokeWeight(8);
    line(hourLength * cos(hourAngle) + (width / 2), hourLength * sin(hourAngle) + (height / 2), width / 2, height / 2);
}
