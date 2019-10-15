
void updateAims(float* aimDir,const AimingData* aim,
Vec3 target, uint count)
{
    for (uint i = 0; i < count; ++i)
    {
        aimDir[i] = dot3(aim->positions[i],target) * aim->mod[i];
    }
}
