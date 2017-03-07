Weapon = Class{}

function Weapon:init()
    self.projectiles = {}
end

function Weapon:update(dt)
    for i,v in ipairs(self.projectiles) do
        v:update(dt)
    end
end

function Weapon:draw()
    for i,v in ipairs(self.projectiles) do
        v:draw()
    end
end

MultiShot = Class{ __includes = Weapon }

function MultiShot:init(projectileCount)
    Weapon.init(self)
    self.projectileCount = projectileCount
    self.spread = 25
end

function MultiShot:spawn(position, angle)
    for i=1,self.projectileCount do
        local projectileAngle = angle - ((math.rad(self.spread) * self.projectileCount) / 2)
        projectileAngle = projectileAngle + (math.rad(self.spread) * 0.5)
        projectileAngle = projectileAngle + (math.rad(self.spread) * (i - 1))

        print(i, angle, projectileAngle)

        table.insert(self.projectiles, Projectile(position, projectileAngle))
    end
end
