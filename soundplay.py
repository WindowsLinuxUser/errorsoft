import pygame
import time

pygame.init()

snd = pygame.mixer

beep = snd.Sound('sounds/beep.wav')

time.sleep(5)

snd.Sound.play(beep)

time.sleep(5)