import styled from 'styled-components';

export const Wrapper = styled.div`
  color: green;
  display: flex;
  flex-direction: row;
  gap: 1rem;
  padding: 3rem;
  width: 100%;
`;

export const Container = styled.div`
  width: 100%;
`;

export const MapContainer = styled(Container)`
  overflow: hidden;
`;
