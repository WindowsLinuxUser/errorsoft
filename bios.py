import pygame
import time
import pcstringtable
import renderer

DispHeight = 480
DispLength = 360

pygame.init()

icon = pygame.image.load('images/app.bmp')
white = (255, 255, 255)
screen = pygame.display.set_mode((DispHeight, DispLength))
clock = pygame.time.Clock()
pygame.display.set_caption("Errorsoft 1.0")
pygame.display.set_icon(icon)

def TextObj(text, font):
    TextSurface = font.render(text, True, white)
    return TextSurface, TextSurface.get_rect()

def DispText(text):
    largeText = pygame.font.Font('fonts/bios.fon')
    TextSurf, TextRect = TextObj(text, largeText)
    TextRect.center = ((DispHeight/2),(DispLength/2))
    screen.blit(TextSurf, TextRect)

    pygame.display.flip()

    time.sleep(2)

time.sleep(5)
print("hi lol")
DispText(pcstringtable.bootup1)
screen.blit(renderer.biosImg, (240, 180))
pygame.display.flip()

def gameLoop():

    Running = True

    while Running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                Running = False
    pygame.display.flip()
    clock.tick(60)
        
gameLoop()
pygame.quit()
quit()