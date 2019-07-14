if (other.state != State.Dead && other.state != State.Rebirth)
{
  other.hp--;
  other.state = State.Damaged;
  instance_destroy();
}